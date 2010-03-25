From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH] powerpc/fsl: add device tree binding for QE firmware
Date: Thu, 25 Mar 2010 12:03:17 -0500
Message-ID: <4BAB9755.2080408@freescale.com>
References: <1269380552-10418-1-git-send-email-timur@freescale.com>
	<ed82fe3e1003240505h59d29c83x6948f8b3b70c4570@mail.gmail.com>
	<90D93687-940F-47FB-8CEA-F3C065EA611D@kernel.crashing.org>
	<fa686aa41003241007mf6052d5s4643795f4a87cdcf@mail.gmail.com>
	<4BAA4C8A.70104@freescale.com>
	<65327.84.105.60.153.1269481760.squirrel@gate.crashing.org>
	<4BAB7E67.6040707@freescale.com> <4BAB816F.5060405@firmworks.com>
	<fa686aa41003250916t3d0839e5m42d7f7f6540e821a@mail.gmail.com>
	<4BAB9120.1060600@freescale.com>
	<fa686aa41003250959v401d14e0g151aa54a57eea39@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <fa686aa41003250959v401d14e0g151aa54a57eea39@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Mitch Bradley <wmb@firmworks.com>, Scott Wood <scottwood@freescale.com>, devicetree-discuss@lists.ozlabs.org, linuxppc-dev@ozlabs.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> For indirect firmware, create a /chosen/firmware node.  Don't add a
> compatible property, 

Oh, I don't like that idea at all.  The compatible property is useful for me to know *how* to parse the binary blob.  

> compatible is for devices and this node is for
> blob data.

But the blob has a format.  For QE firmware, for example, it's this:

struct qe_firmware {
	struct qe_header {
		u32 length;	/* Length of the entire structure, in bytes */
		u8 magic[3];	/* Set to { 'Q', 'E', 'F' } */
		u8 version;	/* Version of this layout. First ver is '1' */
	} header;
	u8 id[62];		/* Null-terminated identifier string */
	u8 split;		/* 0 = shared I-RAM, 1 = split I-RAM */
	u8 count;		/* Number of microcode[] structures */
	struct {
		u16 model;	/* The SOC model  */
		u8 major;	/* The SOC revision major */
		u8 minor;	/* The SOC revision minor */
	} __attribute__ ((packed)) soc;
	u8 padding[4];		/* Reserved, for alignment */
	u64 extended_modes;	/* Extended modes */
	u32 vtraps[8];		/* Virtual trap addresses */
	u8 reserved[4];		/* Reserved, for future expansion */
	struct qe_microcode {
		u8 id[32];	/* Null-terminated identifier */
		u32 traps[16];	/* Trap addresses, 0 == ignore */
		u32 eccr;	/* The value for the ECCR register */
		u32 iram_offset;/* Offset into I-RAM for the code */
		u32 count;	/* Number of 32-bit words of the code */
		u32 code_offset;/* Offset of the actual microcode */
		u8 major;	/* The microcode version major */
		u8 minor;	/* The microcode version minor */
		u8 revision;	/* The microcode version revision */
		u8 padding;	/* Reserved, for alignment */
		u8 reserved[4];	/* Reserved, for future expansion */
	} __attribute__ ((packed)) microcode[1];
	/* All microcode binaries should be located here */
	/* CRC32 should be located here, after the microcode binaries */
} __attribute__ ((packed));

>  Put each firmware blob into a separate property, and make
> the names reasonable (ie. mpc<blah>-qe-firmware).  Have the QE
> reference the firmware blob by property name.

I don't like the idea of using the property name as a pseudo-compatible string.

-- 
Timur Tabi
Linux kernel developer at Freescale
