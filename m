From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [GIT PULL] devicetree changes for v3.3
Date: Mon, 16 Jan 2012 09:21:42 -0700
Message-ID: <20120116162142.GE4223@ponder.secretlab.ca>
References: <CACxGe6udggDJ2QCRXGKzPwHUwzPsFLPZ1Ogc-Negx9z=UHEntg@mail.gmail.com>
 <CA+55aFzWaKBQU-XRYtu0WGq1328nX3hbHDjcn3etOTPsyA=xcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CA+55aFzWaKBQU-XRYtu0WGq1328nX3hbHDjcn3etOTPsyA=xcw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 07, 2012 at 12:41:25PM -0800, Linus Torvalds wrote:
> On Wed, Jan 4, 2012 at 11:11 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
> > Hi Linus,
> >
> > Please pull the following device tree changes queued up for 3.3.
> >
> > There is a signed tag for this pull request: devicetree-for-linus-20120=
104
> >
> > The following changes since commit 805a6af8dba5dfdd35ec35dc52ec0122400b=
2610:
> >
> > =A0Linux 3.2 (2012-01-04 15:55:44 -0800)
> >
> > are available in the git repository at:
> > =A0git://git.secretlab.ca/git/linux-2.6 devicetree/merge
> =

> Ok, so I pulled the tags, but only because I noticed that you mentioned i=
t.
> =

> It would have been much more convenient if you had just named the tag
> in the pull request directly, so that it would have said
> =

> > are available in the git repository at:
> > =A0git://git.secretlab.ca/git/linux-2.6 devicetree-for-linus-20120104
> =

> and then my normal "cut-and-paste the pull request line" JustWorks(tm).
> =

> Of course, since you use those ugly tag names, I then end up editing
> the first line so that the shortlog doesn't fill up with random crud,
> so I'd actually prefer for the tag-name to not have that silly date in
> it. The tag itself is dated, so the date information actually does
> exist inside of it - and if I pull the signed tag, it will then exist
> hidden in the merge too (and can be shown using the new "git show
> --show-signature" thing):

Okay, will do.

g.
