From: "Grant Likely" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Freescale i2c probing (commit 618b26d52)
Date: Tue, 21 Oct 2008 14:05:43 -0600
Message-ID: <fa686aa40810211305j48f997bau706477348d025cbe@mail.gmail.com>
References: <20081021185856.GF22915@ovro.caltech.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20081021185856.GF22915-lulEs6mt1IksTUYHLfqkUA@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Ira Snyder <iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 21, 2008 at 12:58 PM, Ira Snyder <iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org> wrote:
> Hello,
>
> I'm working on a custom board, which is extremely similar to the
> mpc8349emds board. I've been using a custom dts file, based on the
> mpc834x_mds.dts file.
>
> One of the things that is present on my board are some i2c
> temp/voltage/current sensors. I've been working on getting drivers for
> them into mainline, see the lm-sensors list for the patches. I also have
> adm1031 and adm1032 sensors on the board, which have long been supported
> in mainline.
>
> In very recent kernels, probing is intentionally disabled by commit
> 618b26d52.

That is correct

> Based on the commit message, I examined the
> arch/powerpc/boot/dts/tqm85*.dts files. I didn't find anything that
> would serve as a useful example for me.
>
> The ePAPR document describing the device tree didn't help either.
>
> Could you please give me a simple example of how to re-enable the
> probing? I have 11 i2c devices on my board, and I'd rather not have a
> really long kernel command line with tons of "force=" parameters.

Since probing is unreliable on i2c busses we've made the decision not
to support it.  Recommended practice is to list your devices in the
device tree under the i2c bus node; something like this:

                i2c@3000 {
                        #address-cells = <1>;
                        #size-cells = <0>;
                        cell-index = <0>;
                        compatible = "fsl-i2c";
                        reg = <0x3000 0x100>;
                        interrupts = <43 2>;
                        interrupt-parent = <&mpic>;
                        dfsrr;

                        rtc@68 {
                                compatible = "dallas,ds1337";
                                reg = <0x68>;    /* This is the i2c
address of the device */
                        };
                        rtc@XX { /* replace 'XX' with i2c address */
                                compatible = "ADI,adm1031";
                                reg = <0xXX>;    /* This is the i2c
address of the device */
                        };
                        rtc@YY { /* replace 'YY' with i2c address */
                                compatible = "ADI,adm1032";
                                reg = <0xYY>;
                        };

                        /* etc */

                };


We're not supporting probing any more.  If you *really* want it then
add a property to the i2c bus binding (documented in
arch/powerpc/device-tree/) that turns on probing and post it to the
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org and linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org mailing
lists.  Just look at commit 618b26d52 to see what flag needs to be
turned on when the property is present.  Alternately, get your boot
firmware to do the probing for you and populate the device tree before
booting the kernel.

Cheers,
g.


-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
