From: "Grant Likely" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: usb/eth DTS nodes for custom board based on mpc5200
Date: Fri, 5 Dec 2008 08:16:38 -0700
Message-ID: <fa686aa40812050716o6f0b9793gd19566bad2bea40e@mail.gmail.com>
References: <fa686aa40812050640m4b4afe2egef638ca950cff041@mail.gmail.com>
	<537065.14124.qm@web23104.mail.ird.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <537065.14124.qm-ZN+ubyTWu4PyX4RqAA4FmIglqE1Y4D90QQ4Iyu8u01E@public.gmane.org>
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
To: s104259-whZMOeQn8C0@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 5, 2008 at 8:02 AM, Angelo <s104259-whZMOeQn8C0@public.gmane.org> wrote:
> Ok.
>
> Tha main problem is that if I cross-compile kernel for ARCH=ppc everythings
> work fine.
>
>>"Configuring the Ethernet pins for USB IO is just a pin routing board setup
>> task."
>
> What should I do for this?!?!?

Without seeing your board I don't know, but I do know that there have
been a *lot* of changes in mpc5200 support since 2.6.21, including
USB.  You should try using a 2.6.27 kernel.

>
> * I've configured the port_config in  lite5200_setup_cpu(void) function
> [arch/powerpc/platforms/52xx/lite5200.c]. I put in port_config the same
> value that I put with ARCH=ppc!
>
> However I'm sure that my u-boot sets-up the port_config register because
> fatls usb 0:1 / show me the content of usb-storage.

If U-Boot sets up port_config correctly, then you do *not* need to
change the setting in the kernel.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
