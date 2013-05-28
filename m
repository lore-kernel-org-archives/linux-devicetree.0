From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC] [PATCH 0/3] of: allow to support irq domain register as
 platform_device for platform_device
Date: Tue, 28 May 2013 17:41:33 +0200
Message-ID: <201305281741.33951.arnd@arndb.de>
References: <20130528145219.GA30411@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130528145219.GA30411-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
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
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 28 May 2013, Jean-Christophe PLAGNIOL-VILLARD wrote:
>         Today in the current of implementation we populate all the ressources
>         at of_platform_populate time. But this leed to a chicken-egg dilemat
>         some the irq present in DT are from platform_device too. And you can
>         not resolve them as of_platform_populate. So delay the populate of irq
>         at platform_drv_probe.

I like it a lot, thanks for doing this!

Obviously this needs to be tested well on all architectures, but I think
it's the right solution for the problem. I was originally thinking we'd
just allocated the resources dynamically using devm_kmalloc in
platform_drv_probe, but your solution to preallocate them at boot
time seems nicer.

I believe we still need the same patch for the amba bus, and possibly
a couple more, but platform_bus covers most of the interesting cases.

	Arnd
