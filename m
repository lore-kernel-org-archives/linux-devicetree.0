From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] devicetree: bindings: Document qcom,msm-id and qcom,board-id
Date: Mon, 09 Mar 2015 13:11:26 +0100
Message-ID: <89746055.qtEO3GZJmR@wuerfel>
References: <1425503602-24916-1-git-send-email-galak@codeaurora.org> <CAOesGMjpOx4SxY7j8jnoEwLG+mhPKB2st8qCb-hduHLOVw=RcQ@mail.gmail.com> <F9B276F7-61EF-4406-AB46-97D7F1ECEEFE@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <F9B276F7-61EF-4406-AB46-97D7F1ECEEFE@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

On Friday 06 March 2015 14:37:52 Kumar Gala wrote:
> On Mar 6, 2015, at 1:15 PM, Olof Johansson <olof@lixom.net> wrote:
> 
> > On Fri, Mar 6, 2015 at 8:08 AM, Kumar Gala <galak@codeaurora.org> wrote:
> >> 
> >> On Mar 5, 2015, at 7:59 PM, Olof Johansson <olof@lixom.net> wrote:
> >> 
> >>> On Thu, Mar 5, 2015 at 12:23 PM, Kumar Gala <galak@codeaurora.org> wrote:
> >>>> 
> >>>> On Mar 5, 2015, at 1:42 PM, Kevin Hilman <khilman@kernel.org> wrote:
> >>>> 
> >>>>> Kumar Gala <galak@codeaurora.org> writes:
> >>>>> 
> >>>>>> The top level qcom,msm-id and qcom,board-id are utilized by bootloaders
> >>>>>> on Qualcomm MSM platforms to determine which device tree should be
> >>>>>> utilized and passed to the kernel.
> >>>>>> 
> >>>>>> Cc: <devicetree@vger.kernel.org>
> >>>>>> Signed-off-by: Kumar Gala <galak@codeaurora.org>
> >>>>> 
> >>>>> Is this the special magic that allows qcom bootloaders to take a kernel
> >>>>> plus multiple DTBs and figure out which DTB to pass?
> >>>>> 
> >>>>> Kevin
> >>>> 
> >>>> yes
> >>> 
> >>> That's a bummer.
> >>> 
> >>> Luckily, the solution for upstream is still quite simple: Provide only
> >>> one devicetree, and it'll be used, right?
> >> 
> >> We can provide only one, we still need the IDs in the DT.
> > 
> > How are the DTS provided? Concatenated with the kernel, or in a
> > wrapped data format? Or in a separate partition from the kernel?
> 
> Its a wrapped data format that is than concatenated with the kernel if I remember correctly.

Then you should be able to create a tool that can write this concatenated
format and insert these properties from a table that matches the boot
loader, right?

	Arnd
