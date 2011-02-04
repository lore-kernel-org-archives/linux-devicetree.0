From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: [RFC 1/2] ARM:boot:device tree: Allow the device tree binary to be
	appended to zImage
Date: Thu, 03 Feb 2011 23:41:44 -0500 (EST)
Message-ID: <alpine.LFD.2.00.1102032259470.12104@xanadu.home>
References: <20110126212220.6723.28773.stgit@riker>
	<20110126212301.6723.89059.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20110126212301.6723.89059.stgit@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Anton Staaf <robotboy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 26 Jan 2011, John Bonesio wrote:

> This patch provides the ability to boot using a device tree that is appended
> to the raw binary zImage (e.g. cat zImage <filename>.dtb > zImage_w_dtb).
> 
> Constraints:
> 1) A maximum 16k device tree binary is copied to memory at 0x0. If the device
>    tree is bigger than 16k, the kernel will probably fail ungracefully - unless
>    there is a device tree already embedded in the zImage.

This will ungracefully fail on targets where physical memory is not 
located at 0x0.  And this is not an uncommon situation on ARM.

> Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

NAK.  This is not the way to go about this.

First of all, there is a bit of a misdesign in the kernel decompressor.  
It currently verifies that the decompressed data destination doesn't 
conflict with the decompressor itself.  If there is indeed an overlap, 
then the decompressor stores the decompressed data above itself and 
relocates that data back to its final location when it is done 
decompressing.

Instead, the decompressor should move _itself_ out of the way rather 
than moving the decompressed data, as that would make for a smaller 
copy.  I'll try to have a look at that part if no one beats me to it.

Once this is "fixed", then all you'll have to do is to simply pass the 
(possibly relocated with the decompressor) address of the dtb data into 
r2 without copying it anywhere else.  That's it, and no 16KB limit.


Nicolas
