From: Stephen Neuendorffer <stephen.neuendorffer@xilinx.com>
Subject: RE: [PATCH 3/3 RFC] dt: add documentation of ARM dt boot interface
Date: Mon, 31 Jan 2011 10:00:03 -0800
Message-ID: <44dc88e7-3086-4762-8789-f455f3b265ec@VA3EHSMHS027.ehs.local>
References: <20110131073918.9058.37628.stgit@localhost6.localdomain6> <20110131074510.9058.59071.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
In-Reply-To: <20110131074510.9058.59071.stgit@localhost6.localdomain6>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: sam@ravnborg.org
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: linuxppc-dev-bounces+stephen=neuendorffer.name@lists.ozlabs.org
[mailto:linuxppc-dev-
> bounces+stephen=neuendorffer.name@lists.ozlabs.org] On Behalf Of Grant
Likely
> Sent: Sunday, January 30, 2011 11:46 PM
> To: devicetree-discuss@lists.ozlabs.org;
linuxppc-dev@lists.ozlabs.org; linux-kernel@vger.kernel.org
> Cc: sam@ravnborg.org
> Subject: [PATCH 3/3 RFC] dt: add documentation of ARM dt boot
interface
> 
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> ---
> 
> For RFC only.  I do not plan to merge this change yet.
> 
> g.
> 
>  Documentation/devicetree/booting-without-of.txt |   40
+++++++++++++++++++++++
>  1 files changed, 40 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/booting-without-of.txt
b/Documentation/devicetree/booting-
> without-of.txt
> index 6bca668..3950aea 100644
> --- a/Documentation/devicetree/booting-without-of.txt
> +++ b/Documentation/devicetree/booting-without-of.txt

In order to make this more generic, perhaps it should change names, so
that it is actually a description of what the file
describes, as opposed to what it doesn't describe.  "booting.txt"?

> @@ -13,6 +13,7 @@ Table of Contents
> 
>    I - Introduction
>      1) Entry point for arch/powerpc
> +    2) Entry point for arch/arm

We should probably include microblaze here too...

Steve

This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
