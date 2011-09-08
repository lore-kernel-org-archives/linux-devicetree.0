From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2] dtc: Add support for named integer constants
Date: Thu, 8 Sep 2011 11:32:11 -0700
Message-ID: <20110908183211.GM2967@ponder.secretlab.ca>
References: <1314739818-13904-1-git-send-email-swarren@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04B327A62D@HQMAIL01.nvidia.com>
	<CAPnjgZ0NzN510XJZ1ONAbMTS3vrrP8qCV8NYHq4_heZL+PizNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0NzN510XJZ1ONAbMTS3vrrP8qCV8NYHq4_heZL+PizNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 08, 2011 at 06:09:27AM -0700, Simon Glass wrote:
> Hi Stephen,
> 
> On Fri, Sep 2, 2011 at 11:34 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > Stephen Warren wrote at Tuesday, August 30, 2011 3:30 PM:
> >> You may define constants as follows:
> >>
> >> /define/ TWO 2;
> >> /define/ FOUR 4;
> >> /define/ OTHER FOUR;
> >>
> >> And properties may use these values as follows:
> >>
> >> foo = <1 TWO 3 FOUR 5>;
> >>
> >> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > David, Jon,
> >
> > Does this seem reasonable?
> >
> > I think the syntax is simple enough it wouldn't interfere with any more
> > advanced expression/function/... support in the future, and it could be
> > easily extended to allow e.g.:
> >
> > /define/ FOO "BAR";
> > /define/ BAX [0af8dacb0];
> > ...
> 
> This seems very reasonable to me, and very useful. From the syntax it
> looks like lower case symbols are allowed also, which is fine with me.
> 
> I hope that this can go into dtc as we would definitely use it.

What are the risks of symbol conflict with this approach?  I'm
concerned that a poorly chosen /define/ name will break parsing in
non-obvious ways.  Would it be better to have a every define reference
to be explicit in the syntax?

g.
