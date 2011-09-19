From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2] dtc: Add support for named integer constants
Date: Mon, 19 Sep 2011 15:13:55 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04B732144F@HQMAIL01.nvidia.com>
References: <1314739818-13904-1-git-send-email-swarren@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04B327A62D@HQMAIL01.nvidia.com>
	<CAPnjgZ0NzN510XJZ1ONAbMTS3vrrP8qCV8NYHq4_heZL+PizNg@mail.gmail.com>
	<20110908183211.GM2967@ponder.secretlab.ca>
	<20110909013433.GC21002@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110909013433.GC21002-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "jdl-CYoMK+44s/E@public.gmane.org" <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

David Gibson wrote at Thursday, September 08, 2011 7:35 PM:
> On Thu, Sep 08, 2011 at 11:32:11AM -0700, Grant Likely wrote:
> > On Thu, Sep 08, 2011 at 06:09:27AM -0700, Simon Glass wrote:
> > > Hi Stephen,
> > >
> > > On Fri, Sep 2, 2011 at 11:34 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > > > Stephen Warren wrote at Tuesday, August 30, 2011 3:30 PM:
> > > >> You may define constants as follows:
> > > >>
> > > >> /define/ TWO 2;
> > > >> /define/ FOUR 4;
> > > >> /define/ OTHER FOUR;
> > > >>
> > > >> And properties may use these values as follows:
> > > >>
> > > >> foo = <1 TWO 3 FOUR 5>;
> > > >>
> > > >> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
...
> >
> > What are the risks of symbol conflict with this approach?  I'm
> > concerned that a poorly chosen /define/ name will break parsing in
> > non-obvious ways.  Would it be better to have a every define reference
> > to be explicit in the syntax?
> 
> I really don't want to make identifiers - which is essentially what
> we're talking here - explicitly marked, on the basis of "be like C".
> I believe they should be safe, as long as we don't attempt to
> recognize them in property/nodename context.

Grant,

As far as I understand the parser code, the define names aren't accepted
where they'd cause conflicts with node names etc. I just tested using
node names that matched names set up with /define/, and didn't see it
cause any unexpected syntax errors.

Jon, David, 

Does the change look good to go in?

-- 
nvpublic
