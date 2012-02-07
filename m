From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 4/6 V2] of/mtd/nand: add generic bindings and helpers
Date: Tue, 7 Feb 2012 11:10:49 +0100
Message-ID: <20120207101049.GE15647@game.jcrosoft.org>
References: <1327727444-23908-1-git-send-email-plagnioj@jcrosoft.com>
 <201202061720.24996.sr@denx.de>
 <20120207041606.GD15647@game.jcrosoft.org>
 <201202071045.30128.sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201202071045.30128.sr-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10:45 Tue 07 Feb     , Stefan Roese wrote:
> On Tuesday 07 February 2012 05:16:06 Jean-Christophe PLAGNIOL-VILLARD wrote:
> > > > - nand-on-flash-bbt: boolean to enable on flash bbt option if not
> > > > present false
> > > 
> > > Why not use an "empty" type (without argument) for nand-on-flash-bbt
> > > then?
> > 
> > I want to be able to disable it
> 
> Then just don't add this property.
except if it's it done via include a cpu module enable it but the motherboard
dts want to disable it
>  
> > I send a patch to add a helper to manage boolean
> > 
> > this will allow to disable a boolean
> > 
> >     is-ok;          => true
> >     is-ok = <1>;    => true
> >     is-ok = <0>;    => false


Best Regrds,
J.
