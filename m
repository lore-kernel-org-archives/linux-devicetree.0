From: Dong Aisheng <b29396@freescale.com>
Subject: Re: [PATCH 0/3] of: add update device node status via cmdline feature
Date: Fri, 23 Aug 2013 15:13:55 +0800
Message-ID: <20130823071354.GB2460@b29396-Latitude-E6410>
References: <1376564133-11286-1-git-send-email-b29396@freescale.com>
 <520CCB70.8090908@gmail.com>
 <20130821124722.GB17748@b29396-Latitude-E6410>
 <CAL_JsqLa1RkL0MaOCbjYbuQW7+8EKqX8RMfypN=i5UTKaF47=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLa1RkL0MaOCbjYbuQW7+8EKqX8RMfypN=i5UTKaF47=A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, rob@landley.net, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Wed, Aug 21, 2013 at 08:23:05AM -0500, Rob Herring wrote:
....
> > How does uboot handle this according to our needs?
> > Also dynamically update the device node status with uboot command?
> > Can you help point out an example for me to check?
> >
> 
> Here's an example adding a status property with u-boot commands:
> 
> Highbank #fdt print /soc/ethernet
> ethernet@fff50000 {
>         compatible = "calxeda,hb-xgmac";
>         reg = <0xfff50000 0x00001000>;
>         interrupts = <0x00000000 0x0000004d 0x00000004 0x00000000
> 0x0000004e 0x00000004 0x00000000 0x0000004f 0x00000004>;
>         dma-coherent;
> };
> Highbank #fdt set /soc/ethernet status okay
> Highbank #fdt print /soc/ethernet
> ethernet@fff50000 {
>         status = "okay";
>         compatible = "calxeda,hb-xgmac";
>         reg = <0xfff50000 0x00001000>;
>         interrupts = <0x00000000 0x0000004d 0x00000004 0x00000000
> 0x0000004e 0x00000004 0x00000000 0x0000004f 0x00000004>;
>         dma-coherent;
> };
> 

Thanks for the information. I tried and it works.
However it seems using uboot fdt commands is much complicated than kernel
command line way as i did in this patch.
We probably may would rather using add more board dts way if can not accept this patch series.
I already replied that concern in last mail, can you help check it and provide suggestions?

Regards
Dong Aisheng
