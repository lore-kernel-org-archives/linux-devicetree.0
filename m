From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PULL] of nand generic binding
Date: Fri, 9 Mar 2012 12:40:02 +0100
Message-ID: <20120309114002.GP27213@game.jcrosoft.org>
References: <20120217155707.GR1214@game.jcrosoft.org>
 <20120229152534.GH3318@game.jcrosoft.org>
 <20120307082945.GJ21255@game.jcrosoft.org>
 <4F576602.8020808@gmail.com> <20120309014439.235C23E0901@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120309014439.235C23E0901@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 18:44 Thu 08 Mar     , Grant Likely wrote:
> On Wed, 07 Mar 2012 07:43:30 -0600, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On 03/07/2012 02:29 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > > On 16:25 Wed 29 Feb     , Jean-Christophe PLAGNIOL-VILLARD wrote:
> > >> On 16:57 Fri 17 Feb     , Jean-Christophe PLAGNIOL-VILLARD wrote:
> > >>> HI,
> > >>>
> > >>> 	please find attached the generic binding for the MTD nand
> > >>>
> > >>> 	This will add boolean and nand helpers
> > >> is it ok?
> > > I need this for 3.4
> > > 
> > > will you apply it or can I apply it via AT91
> > 
> > Looks fine to me and Grant acked it, so go ahead and take with your at91
> > branch.
> 
> Actually, taking another look at the of_mtd patch, that stuff really
> belongs in the drivers/mtd directory.  I'm not nacking the patch, but
> you should send a follow up to move it into the correct place.
ok

Best Regards,
J.
