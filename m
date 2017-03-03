From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/3] doc: bindings: Add bindings documentation for mtd
 nvmem
Date: Fri, 3 Mar 2017 13:37:44 +0100
Message-ID: <20170303133744.152cf3ca@bbrezillon>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-2-git-send-email-albeu@free.fr>
 <20170302212220.4c3c7bef@bbrezillon> <20170303131705.119021f4@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20170303131705.119021f4@tock>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Alban <albeu@free.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Fri, 3 Mar 2017 13:17:05 +0100
Alban <albeu@free.fr> wrote:

> On Thu, 2 Mar 2017 21:22:20 +0100
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
> > On Thu,  2 Mar 2017 20:50:21 +0100
> > Alban <albeu@free.fr> wrote:
> >   
> > > Add the binding to expose MTD partitions as nvmem providers.    
> > 
> > Looks good. Maybe you should take the case you describe in your
> > cover-letter into account and add an extra layer: add an nvmem sub-node
> > containing the nvmem cells, so that you can expose nvmem cells directly
> > under master MTD devices (and not only partitions).   
> 
> I think that would be the better solution. This can be done
> independently, once we agree on a binding we just have to fix
> of_nvmem_cell_get(). My suggestion would be to have the new binding
> looking like this:
> 
> nvmem-device@10 {
> 	...
> 	nvmem-provider;
> 	nvmem-cells {
> 		compatible = "nvmem-cells";
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 
> 		nvmem-cell@100 {
> 			label = "mac-address";
> 			reg = <0x100 0x200>;
> 		}
> 
> 		...
> 	}
> }
> 
> I would also suggest making the "nvmem-provider" property mandatory
> to indicate that the device provides this capability. Up to now all
> nvmem providers only support this API but I think there might be more
> multi function devices in the future.

If you enforce the name of the child node (here nvmem-cells), you don't
need this extra nvmem-provider property. Am I missing something?


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
