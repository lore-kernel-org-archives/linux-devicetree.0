From: "Yoder Stuart" <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: Device tree binding documentation
Date: Tue, 28 Oct 2008 09:07:39 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA3047E572F@az33exm25.fsl.freescale.net>
References: <fa686aa40810272323s4a5c2f50u8aa999952aaa6b2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-class: urn:content-classes:message
In-Reply-To: <fa686aa40810272323s4a5c2f50u8aa999952aaa6b2-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>, Benja
List-Id: devicetree@vger.kernel.org

 

> -----Original Message-----
> From: 
> devicetree-discuss-bounces+stuart.yoder=freescale.com@ozlabs.o
> rg 
> [mailto:devicetree-discuss-bounces+stuart.yoder=freescale.com@
ozlabs.org] On Behalf Of Grant Likely
> Sent: Tuesday, October 28, 2008 1:23 AM
> To: devicetree-discuss list; Mitch Bradley; Matt Sealey; 
> Benjamin Herrenschmidt; Anton Vorontsov; Loeliger 
> Jon-LOELIGER; Kumar Gala; David Gibson; Hugh Blemings
> Subject: Device tree binding documentation
> 
> I've been thinking a lot more about how to handle documenting new
> bindings for the device tree and getting them up onto a web site of
> some sort.  When this idea originally came up, my first impression was
> to just throw up a wiki somewhere and make it available for everyone
> to use.
> 
> But thinking about it more, it seems like a typical wiki wouldn't
> really encourage a workflow suitable for hammering out new bindings.
> For instance, before a new bindings is published as complete it needs
> to be reviewed and agreed to by the development community, but a
> typical wiki tends toward ad-hoc editing and continual
> update/refinement of the text on-line.  If not careful, a wiki could
> easily lead to unreviewed bindings being added or established bindings
> getting modified in poorly designed or incompatible ways.  It could
> also end up forcing everyone to do their bindings work from within a
> web browser which isn't always the most efficient tool.  We would need
> to come up with new processes for how to manage, review and approve
> content on the wiki so that users can be confident that the
> information on the web site is reliable.
> 
> It seems to me though that we *already* have a process for reviewing
> and accepting changes to a large collective work.  We work together
> every day on the Linux kernel and have established policies about how
> to make changes.  What if we follow the Linux lead and depend on the
> devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org and distributed revision control to
> develop and maintain documentation of new bindings?
> 
> Here is my thought:
> 1. Set up a wiki site to publish the documentation.  Use something
> like ikiwiki which uses git as the back end
> 2. Allow anyone to clone the backend repo
> 3. Binding authors would post patches to the devicetree-discuss
> mailing list for all changes
> 4. Review/discussion/arguments would proceed in the normal way
> 5. Assign a few people to be binding maintainers
> 6. Binding maintainers pick up, commit, (and probably sign) changes
> when there appears to be concensus
> 7. Picked up changes get pushed out to the wiki server which 
> updates the pages
> 
> Also it would allow people to edit bindings on-line:
> 2b. Setup a 'working' site that uses a side branch in the repo.
> 2c. Allow edits in the side branch directly from the web page, but
> still require the binding diff to be posted to the mailing list for
> discussion before being merged into mainline.  The wiki software could
> be modified to automate patch posting without having to resort to the
> command line.
> 
> I'm going to experiment with ikiwiki a bit tomorrow to see if it is
> workable.  I'd also appreciate any feedback on this.

I like the general idea and have been thinking along the
same lines.  Here at Freescale I've set up an internal site
for some of our bindings in development.  The bindings themselves
are text files in a git repo.  Then we have a wiki that links
to them via git web.

The nice thing about the above approach is that you can clone
the git repo, grep through the text bindings, and use your
normal user space tools to look for things like how a
particular property is used and what bindings use it.  But
you also have the convenience of a web interface to get at
the bindings too.

So my vote is to maintain bindings as plain text files.

Some other thoughts:

   -you're going to have generic bindings (e.g. i2c, flash)
    and very specific company specific/proprietary bindings
    (e.g. Freescale security device) and so the structure 
    should accomodate this.   As far as maintainers go, it
    probably makes sense for a Freescale person to maintain
    the Freescale bindings.

   -I'd also like to see the wiki site be broader than just
    bindings and include other device tree related stuff-- e.g.
    documentation on DTC and libfdt.  It could include howtos
    on topics, and links to the ePAPR or any relevant 1275
    documents.

   -one question:  where would this be hosted?   I have been
    working with power.org on getting a wiki for essentially
    the same purpose you've been describing, but it's still
    not a done deal.   Other options would be IBM or 
    Freescale.  I'd like to see the bindings hosted somewhere
    where they have a fairly permanent home.

    If we put the bindings as text docs in a git repo we could
    separate the hosting of the git repo with that of the
    wiki.

Stuart
