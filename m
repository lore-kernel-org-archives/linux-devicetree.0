From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Virtual devices (cpufreq etc) and DT
Date: Wed, 3 Aug 2011 10:50:19 +0100
Message-ID: <20110803095019.GB2607@pulham.picochip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
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

I'm trying to work out how our cpufreq driver fits in with device tree 
bindings.  We have a simple driver that just takes a struct clk and 
calls clk_set_rate() on it.  Is a node in the device tree the right way 
to do this as it isn't really a physical device?  I have the PLL in the 
clocks group of the DT:

	clocks {
		...

		arm_clk: clock@11 {
			compatible = "picochip,pc3x3-pll";
			reg = <0x800a0050 0x8>;
			picoxcell,min-freq = <140000000>;
			picoxcell,max-freq = <700000000>;
			ref-clock = <&ref_clk>, "ref";
			clock-outputs = "cpu";
		};
	};

so I could reference that.  The of clk interface also requires a struct 
device for getting the clk so I guess this is needed...

Jamie
