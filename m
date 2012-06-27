From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: #size-cells = <0> in a bus node, and kernel messages complaining
 about this
Date: Wed, 27 Jun 2012 15:26:38 -0600
Message-ID: <4FEB7A8E.1090409@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I believe I've seen the following construct bandied about as the correct
way of representing a bunch of nodes that have the same name (since they
represent the same type of object) within device-tree.

	regulators {
		compatible = "simple-bus";
		#address-cells = <1>;
		#size-cells = <0>;

		regulator@0 {
			compatible = "regulator-fixed";
			reg = <0>;
...
		};

		regulator@1 {
			compatible = "regulator-fixed";
			reg = <1>;
...
		};
	};

However, when the kernel parses that, it issues messages such as:

prom_parse: Bad cell count for /regulators/regulator@0
prom_parse: Bad cell count for /regulators/regulator@1

The message is issued when #size-cells==0. Is the response simply "don't
do that", and so I should set #size-cells=1, and add a fake size cell in
the reg property too?

Given the number of hits on '#size-cells = <0>' in the kernel source
tree, it seems like I must be missing something here; it's quite widely
used. I guess the warning is probably only emitted when the node with
#size-cells=0 is a bus, and so the children are enumerated to
instantiated devices; perhaps that's why this hasn't been raised before?
