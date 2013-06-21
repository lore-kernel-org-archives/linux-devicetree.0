From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work-JGs/UdohzUI@public.gmane.org>
Subject: =?UTF-8?B?UmVbNF06IFtQQVRDSF0gb2Y6IEFkZCBtb3JlIHN0dWJzIGZvciBub24tT0Yg?=
 =?UTF-8?B?YnVpbGRz?=
Date: Fri, 21 Jun 2013 21:21:15 +0400
Message-ID: <1371835275.689989846@f181.mail.ru>
References: <1371489882-11143-1-git-send-email-shc_work@mail.ru>
 <1371824246.856851759@f137.mail.ru>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work-JGs/UdohzUI@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: =?UTF-8?B?QnJ5YW4gV3U=?= <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?B?R3JhbnQgTGlrZWx5?= <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?B?ZGV2aWNldHJlZS1kaXNjdXNzQGxpc3RzLm96bGFicy5vcmc=?= <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, =?UTF-8?B?TGludXggTEVEIFN1YnN5c3RlbQ==?= <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?Um9iIEhlcnJpbmc=?= <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> On Fri, Jun 21, 2013 at 7:17 AM, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org> wrote:
> >> On Thu, Jun 20, 2013 at 5:26 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> >> > On Thu, 20 Jun 2013 16:49:54 -0700, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> >> Hi Rob,
> >> >>
> >> >> Is this patch good for merging?
> >> >>
> >> >> In Alex's one patch to add device tree supporting for a leds driver,
> >> >> we got building errors due to miss definitions of some of_xxx api
> >> >> functions.
> >> >>
> >> >> It looks obviously to me that we need to fix this in device tree core
> >> >> instead put #ifdef CONFIG_OF everywhere.
> >> >
> >> > Actually, the reason those things aren't universally defined is to catch
> >> > exactly what it caught. The "leds-mc13783: Add devicetree support" patch
> >> > interleaves DT and non-DT parsing which isn't generally a good idea. The
> >> > DT parsing code should be shuffled off into a separate function and/or
> >> > contained with "if (IS_ENABLED(CONFIG_OF)) {}".
> >> >
> >>
> >> Agree, reasonable! I will remove this patch from my tree firstly.
> >>
> >> Alex, could you please update your patch with Grant's feedback?
> >
> > As far I understand you mean only the last part of patch. Where DT support
> > is introduced. Is not it?
> >
> 
> Yes, exactly. I still keep those 2 non-DT related patches in my tree
> and just removed that DT supporting patch.
> 
> Please update that patch and posted again to linux-leds and DT
> maintainers as well.

I am really dont like any #ifdef in the source, but will do if this is only
one way to put this patch into the main tree.

---
