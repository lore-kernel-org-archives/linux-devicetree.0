From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] of: Fix address decoding on Bimini and js2x machines
Date: Fri, 05 Jul 2013 07:55:38 +1000
Message-ID: <1372974938.4122.103.camel@pasglop>
References: <1372831270.4122.36.camel@pasglop> <51D430C7.8030100@gmail.com>
 <CACxGe6ucVocguyNdZ9CiN0ef=WgmOrZe0FyVij_bC7bJZe41=g@mail.gmail.com>
 <20130704161828.EB08D3E08D0@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130704161828.EB08D3E08D0@localhost>
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
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2013-07-04 at 17:18 +0100, Grant Likely wrote:
> > I'll include this in my 3.11 pull request for Linus
> 
> Oops. Ben, I misread what you wrote. It would have been just fine to
> include it in your powerpc -next branch. Sorry for the confusion.
> 
> Anyway, I saw your powerpc pull req and that this patch wasn't in it, so
> I've picked it up and will send it to Linus as soon as the test build
> completes.

Yeah, I was about to add it to a subsequent "fixes" branch but since you
picked it up I'll just leave it.

Thanks !

Cheers,
Ben.
