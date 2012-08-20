From: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 dtc-1.3.0] dtc: Add --strip-disabled option to dtc(v2).
Date: Mon, 20 Aug 2012 11:09:12 -0500
Message-ID: <50326128.6020202@freescale.com>
References: <1345458247-15701-1-git-send-email-srinivas.kandagatla@st.com>
 <E1T3RzA-0002rn-SS@jdl.com> <5032557C.8020507@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5032557C.8020507-qxv4g6HH51o@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
Cc: mmarek-AlSwsSmVLrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Srinivas KANDAGATLA wrote:

> I agree with you to some extent,
> But, Lets say a given SOC can support 5 UARTs But the board actually has
> only one wired up.
> Device tree for SOC has 5 entries for UART with disabled and only one
> UART is enabled by board level device tree.
> This is just once instance, think about SPI's, I2C, PWM's, Ethernets,
> memory devices... and other IP's which might wired up for particular boards.

It's true that in this case, the devices would be marked as "disabled" in
the DTS.  Even using dtsi files won't help, because the board DTS file
will do something like this:

/include/ "uart1.dtsi"
soc: soc@e0000000 {
	uart1: uart@1000 {
		status = "disabled";
	};
};

So I understand why you would want to remove disabled nodes completely.  I
have no objection to your patch, but it's not my decision to make.  I'm
not convinced, however, that it's a real problem.  You're saving only a
10-20KB.  Is that really a problem?

-- 
Timur Tabi
Linux kernel developer at Freescale
