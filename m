From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of/irq: add empty irq_of_parse_and_map() for non-dt builds
Date: Sat, 24 Mar 2012 17:43:22 -0700
Message-ID: <20120325004322.909163E0409@localhost>
References: <1332581257-15989-1-git-send-email-thomas.abraham@linaro.org>
 <4F6DC847.8000902@gmail.com>
 <CAJuYYwR92M7faLaZxT8ycKZB=ORf5J8fELwFENaL_GK7dtG7ew@mail.gmail.com>
 <CAJuYYwQfNNO94_9nQnXH3xEoP6aWSJi4Hcpuh82N2xfGKJ4OnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAJuYYwQfNNO94_9nQnXH3xEoP6aWSJi4Hcpuh82N2xfGKJ4OnA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 24 Mar 2012 21:42:00 +0530, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 24 March 2012 21:37, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On 24 March 2012 18:42, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> On 03/24/2012 04:27 AM, Thomas Abraham wrote:
> >>> Add a empty irq_of_parse_and_map() that returns 0 for non-dt builds and
> >>> avoid having #ifdef CONFIG_OF around all calls to irq_of_parse_and_map().
> >>>
> >>> Suggested-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> >>> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>> ---
> >>
> >> Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >>
> >> Go ahead and merge with the rest of your series.
> >>
> >> Rob
> >
> > Thanks Rob. It would be good if this patch goes via Grant's
> > devicetree/next. The other patch series that I have posted would go
> > via Samsung maintainer's dt-branch into which this patch can be merged
> > from Grant's devicetree/next.

As replied to on original patch, this isn't necessary.  Just merge it
via the Samsung tree since you've already got my acked-by on it.

g.
