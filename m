From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH] powerpc/fsl: add device tree binding for QE firmware
Date: Wed, 24 Mar 2010 07:05:15 -0500
Message-ID: <ed82fe3e1003240505h59d29c83x6948f8b3b70c4570@mail.gmail.com>
References: <1269380552-10418-1-git-send-email-timur@freescale.com>
	<fa686aa41003232307s39af071bn6377800951d6615c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <fa686aa41003232307s39af071bn6377800951d6615c@mail.gmail.com>
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
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 24, 2010 at 1:07 AM, Grant Likely <grant.likely@secretlab.ca> w=
rote:

>> +- fsl,firmware-phandle:
>> + =A0 =A0Usage: required
>> + =A0 =A0Value type: <phandle>
>> + =A0 =A0Definition: Points to a firmware node (see "QE Firmware Node" b=
elow)
>> + =A0 =A0 =A0 =A0that contains the firmware that should be uploaded for =
this QE.
>> + =A0 =A0 =A0 =A0The compatible property for the firmware node should sa=
y,
>> + =A0 =A0 =A0 =A0"fsl,qe-firmware".
>> +
>
> Why the phandle redirection? =A0Why not just put the firmware blob into
> a property in the QE node, or as a subnode?

Because there might be multiple QE devices on a single chip, and each
will need to upload the same firmware.  So instead of embedding the
firmware multiple times, just embed it once, and have a pointer.

I could expand the binding to say that a node should look for either
fsl,firmware-phandle *or* a child fsl,qe-firmware node, but I think
that overly complicates things.  It also makes it more complicated for
the boot loader to create the fsl,qe-firmware node, since it has to
figure out where to put that node.  I can imaging a situation where
the DTS has the fsl,firmware-phandle properties and an empty
fsl,qe-firmware node at the root, and the boot loader just fills it
in.

-- =

Timur Tabi
Linux kernel developer at Freescale
