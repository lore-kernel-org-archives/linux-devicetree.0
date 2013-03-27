From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [query] IMX6 DTS : Device node with two interrupt parents
Date: Wed, 27 Mar 2013 15:04:46 +0800
Message-ID: <20130327070444.GD2767@r65073-Latitude-E6420>
References: <CAGp-zT7d-=CXTH41hsMgA_bZLoQot+uAAoD4hs5=UU1n__cEaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGp-zT7d-=CXTH41hsMgA_bZLoQot+uAAoD4hs5=UU1n__cEaw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Pankaj Chauhan <pankaj.chauhan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Copy devicetree-discuss ...

On Wed, Mar 27, 2013 at 08:40:58AM +0530, Pankaj Chauhan wrote:
> All,
> 
> I have a query for adding device node in dts of board based on IMX6.
> On the board i have a controller whole interrupt lines are connected
> to interruptible GPIOs. But problem is out of three interrupt lines
> two are connected to gpio4 and one is connected to gpio5, which means
> i have two interrupt parents to specify in device node. My node looks
> something like this:
> 
> queue-group@0 {
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +					reg-names = "queue-group0";
> +					reg = <0x0d480000 0x1000>;
> +					interrupts = <11 0 27 0 26 0>;
> +                                      interrupt-parent = <&gpio4>;
> +				};
> 
> here 27 and 26 are on gpio4 but 11 is on gpio5.  Is there a way to
> specify multiple interrupt parents? what is the correct way to handle
> such configuration.

You may want to check how interrupt-map works.  See ePAPR v1.1
2.4.3 Interrupt Nexus Properties for details.

Shawn
