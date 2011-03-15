From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 3/3] olpc-battery: bind to device tree
Date: Mon, 14 Mar 2011 21:32:03 -0600
Message-ID: <20110315033203.GB5600@angua.secretlab.ca>
References: <20110304171241.0DCF89D401E@zog.reactivated.net>
	<20110305045440.GI7579@angua.secretlab.ca>
	<AANLkTik-bXgiAtLsB4rRS2oo-xToLjHkNkNy=FV11UA5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTik-bXgiAtLsB4rRS2oo-xToLjHkNkNy=FV11UA5-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 12, 2011 at 05:56:12PM +0000, Daniel Drake wrote:
> On 5 March 2011 04:54, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > I want to see all new compatible properties documented in
> > Documentation/devicetree/bindings. =A0It may not be the best place for
> > binding documentation since it is currently tied to Linux, but it is
> > better than anything else we currently have.
> =

> Ok, how do you think it should look?
> =

> Something simple like this? new file at bindings/power_supply/olpc_batter=
y.txt :
> =

> OLPC battery
> ~~~~~~~~~~~~
> =

> Required properties:
>   - compatible : "olpc,xo1-battery"

Yes.  At the very least it captures the usage of a compatible
property.  Eventually I'm going to translate this stuff into a cross
referenced online database.
