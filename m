From: "Grant Likely" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Device tree binding documentation
Date: Tue, 28 Oct 2008 00:23:27 -0600
Message-ID: <fa686aa40810272323s4a5c2f50u8aa999952aaa6b2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7sXa4x6EXUF0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I've been thinking a lot more about how to handle documenting new
bindings for the device tree and getting them up onto a web site of
some sort.  When this idea originally came up, my first impression was
to just throw up a wiki somewhere and make it available for everyone
to use.

But thinking about it more, it seems like a typical wiki wouldn't
really encourage a workflow suitable for hammering out new bindings.
For instance, before a new bindings is published as complete it needs
to be reviewed and agreed to by the development community, but a
typical wiki tends toward ad-hoc editing and continual
update/refinement of the text on-line.  If not careful, a wiki could
easily lead to unreviewed bindings being added or established bindings
getting modified in poorly designed or incompatible ways.  It could
also end up forcing everyone to do their bindings work from within a
web browser which isn't always the most efficient tool.  We would need
to come up with new processes for how to manage, review and approve
content on the wiki so that users can be confident that the
information on the web site is reliable.

It seems to me though that we *already* have a process for reviewing
and accepting changes to a large collective work.  We work together
every day on the Linux kernel and have established policies about how
to make changes.  What if we follow the Linux lead and depend on the
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org and distributed revision control to
develop and maintain documentation of new bindings?

Here is my thought:
1. Set up a wiki site to publish the documentation.  Use something
like ikiwiki which uses git as the back end
2. Allow anyone to clone the backend repo
3. Binding authors would post patches to the devicetree-discuss
mailing list for all changes
4. Review/discussion/arguments would proceed in the normal way
5. Assign a few people to be binding maintainers
6. Binding maintainers pick up, commit, (and probably sign) changes
when there appears to be concensus
7. Picked up changes get pushed out to the wiki server which updates the pages

Also it would allow people to edit bindings on-line:
2b. Setup a 'working' site that uses a side branch in the repo.
2c. Allow edits in the side branch directly from the web page, but
still require the binding diff to be posted to the mailing list for
discussion before being merged into mainline.  The wiki software could
be modified to automate patch posting without having to resort to the
command line.

I'm going to experiment with ikiwiki a bit tomorrow to see if it is
workable.  I'd also appreciate any feedback on this.

Cheers,
g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
