From: Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>
Subject: Re: dts-binding doc for opencores
Date: Tue, 25 Jan 2011 10:33:30 +0100
Message-ID: <1295948010.2178.32.camel@localhost>
References: <4D3E3764.1050603@wytron.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4D3E3764.1050603-SDxUXYEhEBiCuPEqFHbRBg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Chou <thomas-SDxUXYEhEBiCuPEqFHbRBg@public.gmane.org>
Cc: Nios2 development list <nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Thomas,

> 
> As Grant suggested, we will need to document the dts property for 
> opencores drivers. Do you have any suggestion?
> 
> linux-2.6/Documentation/powerpc/dts-bindings/opencores.txt
> 
> project: tiny SPI controller
> core: tiny_spi
> driver: spi_oc_tiny
> compat: "opencores,tiny-spi-rtlsvn2"
> Optional properties:
>         - clock-frequency : input clock freq to the core
>         - baud-width: baud rate divider width of the core
> 

Is clock-frequency really optional?

Otherwise, I think this looks pretty good.  I'd add the following
though:

i) a description of the reg parameter, given that the address range of
the device is known:  0x10+ROUND_UP(BAUD_WIDTH/8) (right?)

reg: <BASE 0x10+ROUND_UP(BAUD_WIDTH/8)>

ii) add the 'interrupts' property to the list of optional properties

interrupts: <IRQ NUMBER>

Finally, the name 'baud-width' is a bit strange.  I know what you want
to say with it, but it doesn't feel very intuitive.  Perhaps
'clk-divider-bits'...???  or 'sclk-divider-bits'???

Otherwise, a better description of the baud-width parameter, perhaps:

baud-width:  width, in bits, of the programmable divider used to scale
the input clock to SCLK

Best regards,
Jonas
