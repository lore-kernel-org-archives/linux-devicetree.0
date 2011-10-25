From: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: libfdt queries
Date: Tue, 25 Oct 2011 11:28:51 +0530
Message-ID: <4EA6501B.3030907@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

I am using libfdt v1.3.0 for modifying the dtb file from the bootloader
(not U-Boot). I have a .dtb file whose bootargs have to be modified
before passing over to the kernel. This is the sequence that I am following:

<snip>

newlen = fdt_totalsize(blob) + 512;
fdt_open_into(blob, blob, newlen)

node = fdt_path_offset(blob, "/chosen");
if (node < 0)
    <error handling code>

fdt_setprop_string(blob, node, "bootargs", cmdline)

<snip>

Now with the above code the serial console on my board does not come up
with the default bootargs that are present in the .dts file. If I
manipulate the bootargs string in the .dts file with some additional
garbage characters and then run the above code then I see that the
serial console comes up. I suspect that the dtb is not getting updated
properly with the above apis. Somehow the dtb contents are getting
overwritten and the serial console info is getting overwritten I think.

If I add a partial command line to my dts, then modifying the bootargs
from fastboot does not corrupt the dtb file and I can see the kernel
console come up.

Any pointers or ideas where I might have screwed up?



-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
