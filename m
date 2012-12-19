From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of: Fix export of of_find_matching_node_and_match()
Date: Wed, 19 Dec 2012 15:04:18 +0000
Message-ID: <20121219150418.6EEE03E0AD7@localhost>
References: <1355914716-19469-1-git-send-email-grant.likely@secretlab.ca>
 <CACxGe6vTxQGr+t5O4q0J265K02-EEeEiGoOTvB1o-ee2bBrhZg@mail.gmail.com>
 <50D1C608.9040001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50D1C608.9040001-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 19 Dec 2012 07:50:00 -0600, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 12/19/2012 05:02 AM, Grant Likely wrote:
> > On Wed, Dec 19, 2012 at 10:58 AM, Grant Likely
> > <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> >> Commit 50c8af4cf9, "of: introduce for_each_matching_node_and_match()"
> >> renamed of_find_matching_node() to of_find_matching_node_and_match() and
> >> created a new static inline of_find_matching_node() wrapper around the
> >> new name. However, the change neglected to change the EXPORT_SYMBOL()
> >> reference causing build errors for modules.
> >>
> >> This patch fixes the EXPORT_SYMBOL() statement. Discovered on a PowerPC
> >> Efika build with the mpc52xx_uart driver being built as a module.
> >>
> >> Reported-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> >> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> >> Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >> Cc: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
> > 
> > Rob, I've just pushed this out to my devicetree/merge branch. If
> > you've got any fixes queued up for Linus, then please pull this in
> > before sending them on to him. Otherwise I'll send Linus a pull req
> > for this fix this evening. Ether way, please reply to let me know what
> > you're going to do.
> > 
> 
> The only item on my todo is this one:
> 
> "of: define struct device in of_platform.h if !OF_DEVICE and !OF_ADDRESS"
> 
> But I'm not going to get to it today if you want to pick it up.

I don't see that one anywhere. Where did it come from?

g.
