From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] of: support an enumerated-bus compatible value
Date: Tue, 24 Jul 2012 20:05:50 +0000
Message-ID: <201207242005.50982.arnd@arndb.de>
References: <4FF1C567.4060809@wwwdotorg.org>
 <201207241848.53308.arnd@arndb.de> <500EF7C5.6060406@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <500EF7C5.6060406-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 24 July 2012, Stephen Warren wrote:
> > One would think that, but the of_address handling code actually treats
> > empty ranges the same as missing ranges, in violation of the spec,
> > and as a workaround to deal with some powermac machines that required
> > this.
> > 
> > I'd rather fix the code to deal with this correctly.
> 
> OK, so what is correctly then?
> 
> Adding an explicit enumerated-bus compatible value/node-type/binding
> seems like "correctly" to me, but it seemed like others didn't agree.

I'm talking about the issue that you cannot currently have a bus
without a "ranges" property and #size-cells=<0> and expect Linux
to turn the devices on it into platform devices, because the
of_translate_address function fails on this.

	Arnd
