From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH V2] dtc: Implement -d option to write out a dependency file
Date: Thu, 12 Jan 2012 15:57:18 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17801D1E89@HQMAIL01.nvidia.com>
References: <1326215568-30700-1-git-send-email-swarren@nvidia.com>
 <20120110233324.GB4935@truffala.fritz.box> <E1RkzBe-00058J-Vo@jdl.com>
 <20120111230707.GN4935@truffala.fritz.box> <E1RlKdQ-00037v-IU@jdl.com>
 <20120112231136.GY4935@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120112231136.GY4935-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

David Gibson wrote at Thursday, January 12, 2012 4:12 PM:
> On Thu, Jan 12, 2012 at 07:24:04AM -0600, Jon Loeliger wrote:
> > > On Wed, Jan 11, 2012 at 08:29:58AM -0600, Jon Loeliger wrote:
> > > > > On Tue, Jan 10, 2012 at 10:12:48AM -0700, Stephen Warren wrote:
> > > > > > This will allow callers to rebuild .dtb files when any of the /include/d
> > > > > > .dtsi files are modified, not just the top-level .dts file.
> > > > > >
> > > > > > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > >
> > > > > Nice.
> > > > >
> > > > > Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> > > > >
> > > > > Jon, please apply.
> > > >
> > > > Will do with a patch for the DTC repo.
> > >
> > > Uh.. this patch is for the dtc repo, he sent it in addition to the one
> > > against the kernel version.
> >
> > I did not receive this patch for the DTC repo.
> > I have this patch for the kernel only on the arm list.
> >
> > I'm not saying he didn't do the worl, nor am I saying he
> > didn't post such a past.  I'm saying *I* don't have it!
> 
> Um.. so, the mail I was replying to you above, was for the dtc repo
> and you were on the recipient list.  Given the frequency with which I
> need to resend my own patches, I'm beginning to wonder if your mail
> system is dropping things, Jon..

In this case, it was my fault.

Jon's email system validates SPF and doesn't accept messages where that
fails. I was sending my patch through my personal email server but using
NVIDIA's email address, hence this failed the SPF check. I think I wasn't
notified of this because the bounce message my server would have
presumably generated probably experienced some similar issue getting back
to my NVIDIA email account.

I've reconfigured git to send email through NVIDIA's servers, although
now that means I have to be on the VPN to send patches:-(

-- 
nvpublic
