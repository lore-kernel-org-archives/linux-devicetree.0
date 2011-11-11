From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mach-ux500: add devicetree compat nodes
Date: Fri, 11 Nov 2011 17:26:07 +0100
Message-ID: <CACRpkdZrWW2jUYC0P7yY322YMdn9+4_NaGPhKtpGwR+e=F6+0A@mail.gmail.com>
References: <1321023902-18870-1-git-send-email-niklas.hernaeus@linaro.org>
 <4EBD3C85.1010508@gmail.com>
 <CACRpkda-9OVP8E1qO3Nc5znw_v7cKFiv8T5HHwTCnY2C9Fg7iA@mail.gmail.com>
 <4EBD49A6.2020306@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EBD49A6.2020306-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Nicolas.Pitre.nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant.Likely.grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 11, 2011 at 5:13 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 11/11/2011 09:59 AM, Linus Walleij wrote:
>>
>> So - different .init_machine() calls, needed to simplify the board
>> files as of now. (Patch from Lee Jones.)
>
> But ultimately I would expect that the init_machine calls to be the same
> with a DT based machine. This goes back to do we add DT to existing
> boards or create a new clean DT machine and add to it as boards are
> converted?

Yes that should be the ultimate goal. So the current per-board
init functions register the I2C, MMC (SDI), SPI, UART and
regulator devices etc. So then these drivers need to be patched to
get their board/platform data from DT first.

In that case we should hold this patch off and only keep it for
internal testing until all necessary drivers are ready and patched
so we can replace all board files with a single DT-based one,
instead of this compromise solution.

Is this what everybody else does?

Thanks,
Linus Walleij
