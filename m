From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 3/3] dtc: Add support for variable sized cells
Date: Fri, 23 Sep 2011 10:14:53 +1000
Message-ID: <20110923001453.GB12286@yookeroo.fritz.box>
References: <1316637731-21872-1-git-send-email-robotboy@chromium.org>
	<1316637731-21872-4-git-send-email-robotboy@chromium.org>
	<20110922024255.GG22223@yookeroo.fritz.box>
	<CAF6FioV55CX9wBo5d1nKV=_t4+6BtHS6_hays08ZVgs2eDFvtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAF6FioV55CX9wBo5d1nKV=_t4+6BtHS6_hays08ZVgs2eDFvtA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 22, 2011 at 11:02:59AM -0700, Anton Staaf wrote:
> On Wed, Sep 21, 2011 at 7:42 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Wed, Sep 21, 2011 at 01:42:11PM -0700, Anton Staaf wrote:
> >> Cells of size 8, 16, 32, and 64 bits are supported. =A0The new
> >> /size/ syntax was selected so as to not pollute the reserved
> >> keyword space with uint8/uint16/... type names.
> >>
> >> With this patch the following property assignment:
> >>
> >> =A0 =A0 property =3D /size/ 16 <0x1234 0x5678 0x0 0xffff>;
> >
> > I'm now thinking that just plain "/size/" is maybe a bit too generic
> > for this keyword. =A0But I'm not sure what would be better. =A0Maybe
> > /cellsize/ or /intsize/ or /arraysize/.
> =

> Also /bits/ or /cellbits/ might make good choices because the size is in
> bits and not in bytes.

True; they are better ideas.

>  I'm not fond of /arraysize/ because we are
> specifying the size of each element in the array, not the array
> itself.

Yeah, good point.

-- =

David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
