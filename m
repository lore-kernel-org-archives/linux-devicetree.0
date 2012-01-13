From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH V2 REPOST] dtc: Implement -d option to write out a
 dependency file
Date: Fri, 13 Jan 2012 07:25:55 -0600
Message-ID: <E1Rlh8l-00021p-HV@jdl.com>
References: <1326393060-9304-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1326393060-9304-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> This will allow callers to rebuild .dtb files when any of the /include/d
> .dtsi files are modified, not just the top-level .dts file.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> ---
> v2: Replaced fputs/fputc with fprintf.
> v2 repost: Add David's ack.
> 
> This patch is for the dtc repository. I'm reposting it because Jon said it
> didn't make it directly to him the first time around. Ah, now I see the
> email issue; NVIDIA started publishing SPF records and I was using my
> nvidia.com email address but sending through my own email servers. I've
> fixed that, so hopefully this message will go through.
> 
>  Documentation/manual.txt |    3 +++
>  dtc.c                    |   20 +++++++++++++++++++-
>  srcpos.c                 |    4 ++++
>  srcpos.h                 |    1 +
>  tests/dependencies.cmp   |    1 +
>  tests/dependencies.dts   |    6 ++++++
>  tests/deps_inc1.dtsi     |    1 +
>  tests/deps_inc2.dtsi     |    1 +
>  tests/run_tests.sh       |    4 ++++
>  9 files changed, 40 insertions(+), 1 deletions(-)
>  create mode 100644 tests/dependencies.cmp
>  create mode 100644 tests/dependencies.dts
>  create mode 100644 tests/deps_inc1.dtsi
>  create mode 100644 tests/deps_inc2.dtsi

And applied finally.

jdl
