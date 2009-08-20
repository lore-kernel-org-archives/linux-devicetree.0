From: "Herzig, Christian" <Christian.Herzig-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Subject: RE: Device Tree configuration for I2C-Multiplexer and its Clients
Date: Fri, 21 Aug 2009 00:14:27 +0200
Message-ID: <D839955AA28B9A42A61B9181506E27C401B33A43@SRVCHBER1212.ch.keymile.net>
References: <D839955AA28B9A42A61B9181506E27C401B337A5@SRVCHBER1212.ch.keymile.net>
	<fa686aa40908200827t2d5273c9g84f58f09b471074f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
In-Reply-To: <fa686aa40908200827t2d5273c9g84f58f09b471074f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: chris-jmrfutXsf6TiB9QmIjCX8w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant!

mux@70 {
        #address-cells = <2>;   /* Note this change */ /* I've noted ;-)
*/
        #size-cells = <0>;
        compatible = "philips, pca9542";
        reg = <0x70>;

        /* channel 0 */
        dtt@0,48 {
                compatible = "national,lm75";
                reg = < 0 0x48 >; /* now reg is specified with 2 cells
*/
        };
        at24@0,50 {
                compatible = "at24,24c08";
                reg = < 0 0x50 >;
        };
        /* channel 1 */
        at24@1,50 {
                compatible = "at24,24c08";
                reg = < 1 0x50 >;
        };
};

That looks very good to me!

Thank you very much, 
Christian
