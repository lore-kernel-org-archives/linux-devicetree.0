From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mach-ux500: add devicetree compat nodes
Date: Fri, 11 Nov 2011 18:00:10 +0100
Message-ID: <CACRpkdb6n2mRWohGrv1d0VFLRsTMDPDzow7UY6jw=9rdt-ZkqA@mail.gmail.com>
References: <1321023902-18870-1-git-send-email-niklas.hernaeus@linaro.org>
 <4EBD3C85.1010508@gmail.com>
 <CACRpkda-9OVP8E1qO3Nc5znw_v7cKFiv8T5HHwTCnY2C9Fg7iA@mail.gmail.com>
 <4EBD49A6.2020306@gmail.com>
 <CACRpkdZrWW2jUYC0P7yY322YMdn9+4_NaGPhKtpGwR+e=F6+0A@mail.gmail.com>
 <4EBD4F79.90302@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EBD4F79.90302-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Fri, Nov 11, 2011 at 5:38 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> [Me]
>> In that case we should hold this patch off and only keep it for
>> internal testing until all necessary drivers are ready and patched
>> so we can replace all board files with a single DT-based one,
>> instead of this compromise solution.
>>
> I would not hold off. You only need to have a minimal set that's enough
> to boot.

In our case UART, I2C and MMC is necessary to boot, so then we
anyway need to wait for these to be patched first. So we'd better hold
it back for now I think.

Linus Walleij
