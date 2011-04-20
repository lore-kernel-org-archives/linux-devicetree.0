From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] dt/flattree: Fix return value of early_init_dt_scan_memory
Date: Tue, 19 Apr 2011 20:44:58 -0600
Message-ID: <BANLkTi=Kw0L2-cfGe9=rK__VYrXw31_itA@mail.gmail.com>
References: <1303225269-10092-1-git-send-email-shawn.guo@linaro.org>
	<1303260446.28913.4.camel@pororo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1303260446.28913.4.camel@pororo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 19, 2011 at 6:47 PM, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
> Hi Shawn,
>
>> It fixes the return value of funciont early_init_dt_scan_memory on
>> the success return path.
>
> [In general, the changelog should explain why you're making this change,
> not just re-iterate what the patch does. Does this fix a problem you
> were seeing?]
>
> With regards to this specific patch - I don't think this is correct; if
> we return 1 here, we'll abort the of_scan_flat_dt loop after
> successfully parsing one memory node, whereas machines may have multiple
> nodes. This change will break booting on those machines.
>
> Cheers,

Yes, the current code is correct.  All of the memory nodes are
supposed to be processed.

g.
