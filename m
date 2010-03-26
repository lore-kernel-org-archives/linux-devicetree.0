From: Rafal Jaworowski <raj@semihalf.com>
Subject: Re: [PATCH] powerpc/fsl: add device tree binding for QE firmware
Date: Fri, 26 Mar 2010 19:23:17 +0100
Message-ID: <01EA90A9-7B78-4803-80CE-0EF878DE2A85@semihalf.com>
References: <1269380552-10418-1-git-send-email-timur@freescale.com>
	<fa686aa41003232307s39af071bn6377800951d6615c@mail.gmail.com>
	<ed82fe3e1003240505h59d29c83x6948f8b3b70c4570@mail.gmail.com>
	<90D93687-940F-47FB-8CEA-F3C065EA611D@kernel.crashing.org>
	<fa686aa41003241007mf6052d5s4643795f4a87cdcf@mail.gmail.com>
	<4BAA4C8A.70104@freescale.com>	<65327.84.105.60.153.1269481760.squirrel@gate.crashing.org>
	<ed82fe3e1003250742t5affee7dudca651ab3352bc16@mail.gmail.com>
	<fa686aa41003250910n437e4e73p34645f5627d25784@mail.gmail.com>
	<4BAB90B1.9080603@freescale.com> <4BAB9361.8090900@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1077)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <4BAB9361.8090900@freescale.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Timur Tabi <timur@freescale.com>
Cc: Scott Wood <scottwood@freescale.com>, linuxppc-dev@ozlabs.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


On 2010-03-25, at 17:46, Timur Tabi wrote:

> The more I think about it, the more I believe that this is how we're going to have to do it.  Whether or not Freescale can embed a non-GPL firmware into a device tree is still undecided.  It may require relicensing all of our device trees as dual bsd/gpl first.  Technically, we should probably do that anyway.

The dual-licensing process has already started, see the following :-)

http://p4db.freebsd.org/changeView.cgi?CH=173836
http://p4db.freebsd.org/changeView.cgi?CH=174365

Rafal
