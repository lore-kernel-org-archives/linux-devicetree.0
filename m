From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [ATTEND] Handling of devicetree bindings
Date: Sat, 20 Jul 2013 06:48:57 +0100
Message-ID: <20130720054857.E73F83E14AB@localhost>
References: <20130713192647.GA3798@katana> <20130713204927.GA1124@roeck-us.net>
 <CACRpkdaJ5podVCrb7XuhhGF0Oco+eLrFH0EVGZM0MBbGP9m7WQ@mail.gmail.com>
 <20130715165620.GA29040@kroah.com>
 <1373914227.2128.24.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373914227.2128.24.camel-Fexsq3y4057IgHVZqg5X0TlWvGAXklZc@public.gmane.org>
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
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, ksummit-2013-discuss-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 15 Jul 2013 19:50:27 +0100, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> On Mon, 2013-07-15 at 09:56 -0700, Greg KH wrote:
> > How about a hint for subsystem maintainers as to what exactly we should
> > be looking for with these bindings?  I for one have no idea what is
> > "right" vs. "wrong" with them, so a document explaining this would be
> > good to have.
> > 
> > Or if we already have it, a pointer to it perhaps?
> 
> The biggest thing is that it should describe the *hardware*, in a
> fashion which is completely OS-agnostic.
> 
> The same device-tree binding should work for Solaris, *BSD, Windows,
> eCos, and everything else.
> 
> I've heard tales of people having to keep device-tree files for their
> board tightly in sync with the specific *version* of the Linux kernel
> that they were shipped with.
> 
> That makes me very sad, because it almost certainly means that someone
> has done it completely and utterly wrong.

It is wrong, but it has happened. At first it was getting up and running
with DT in ARM which was a major shift, but now it is down to lack of
process. There is a new team of maintainers for DT bindings that I've
just sent and email about. The ultimate goal is to add schema checking
to device tree bindings and get them out of the kernel entirely. That
should resolve the tightly-coupled problem that we're currently dealing
with.

g.
