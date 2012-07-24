From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] of: support an enumerated-bus compatible value
Date: Tue, 24 Jul 2012 11:38:18 -0600
Message-ID: <500EDD8A.2010701@wwwdotorg.org>
References: <4FF1C567.4060809@wwwdotorg.org> <4FF1D8F9.9040005@firmworks.com>
 <4FF1DDBD.9050106@wwwdotorg.org> <4FF1EA1A.9030307@firmworks.com>
 <4FF1F955.6030204@wwwdotorg.org>
 <6BC22F77-77D7-45DF-821A-6CA2DBADEA59@kernel.crashing.org>
 <4FF22031.3060206@wwwdotorg.org>
 <FE3C6687-727E-4191-9D37-9E71EBFEF0AE@kernel.crashing.org>
 <20120703104720.GB25995@sirena.org.uk>
 <F928AF0B-65CF-48D1-8DB5-4C27FD6AB82F@kernel.crashing.org>
 <20120703144242.GE25995@sirena.org.uk>
 <DF4AD962-D8A8-43AA-AF14-5DBF65505EDF@kernel.crashing.org>
 <4FF3138F.9090800@wwwdotorg.org> <4FF341B0.9090901@firmworks.com>
 <4FF34EC2.6040908@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FF34EC2.6040908-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I don't recall us getting any real conclusion out of this thread. How
about I drop the enumerated-bus concept and just use simple-bus, and
have reg be 2 cells (addr, size) in the child nodes:

regulators {
	compatible = "simple-bus";
	#address-cells = <1>;
	#size-cells = <1>;

	regulator@0 {
		compatible = "regulator-fixed";
		reg = <0 1>;
		regulator-name = "vdd_1v5";
		regulator-min-microvolt = <1500000>;
		regulator-max-microvolt = <1500000>;
		gpio = <&pmic 0 0>;
	};

	regulator@1 {
		compatible = "regulator-fixed";
		reg = <1 1>;
		regulator-name = "vdd_1v2";
		regulator-min-microvolt = <1200000>;
		regulator-max-microvolt = <1200000>;
		gpio = <&pmic 1 0>;
		enable-active-high;
	};
};

That makes the child nodes' reg property slightly more complex since I
don't get to elide the size cell, but does mean that we don't have to
change anything (code or bindings) at all to make it work. I guess the
lack of any ranges property within the top-level regulators node makes
it clear enough that the bus/child address space is not part of the
parent CPU's address space.
