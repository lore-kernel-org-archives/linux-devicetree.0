From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 RESEND 2] gpio-vx855: add device tree binding
Date: Thu, 22 Sep 2011 11:41:36 -0600
Message-ID: <20110922174136.GP17168@ponder.secretlab.ca>
References: <20110916181220.E12109D401C@zog.reactivated.net>
	<20110917155615.GT3523@ponder.secretlab.ca>
	<CAMLZHHQqqs6k2i-RCSJ0YkZ2keVNPNQV9EbVccxUW1kjUq6f_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMLZHHQqqs6k2i-RCSJ0YkZ2keVNPNQV9EbVccxUW1kjUq6f_Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 19, 2011 at 10:27:07AM +0100, Daniel Drake wrote:
> Hi Grant,
> 
> Thanks for looking at this.
> 
> On Sat, Sep 17, 2011 at 4:56 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > drivers/mfd/vx855.c should be modified to assign pdev->of_node, which
> > can be used here for setting up c->of_node.
> 
> There doesn't seem to be any obvious place in mfd/vx855.c to insert
> this. All the platform device creation and addition is done inside the
> mfd layer (e.g. mfd_add_device()). Should I look at extending the MFD
> API to allow for of_nodes to be passed in?

yes.

g.
