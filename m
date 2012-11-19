From: Rajanikanth HV <rajanikanth.hv-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH Resend V2] dt: add helper function to read u8 & u16
	variables & arrays
Date: Mon, 19 Nov 2012 12:05:47 +0530
Message-ID: <CAB4BAktsPviZ11QjSGgdzaV0uvLq3TLk4au6=dOgv7NtA9nc4Q@mail.gmail.com>
References: <64c5278ebdec503f83e9b7002bf13affb7f3260f.1351225085.git.viresh.kumar@linaro.org>
	<50991C41.50705@gmail.com>
	<CAOh2x==LNuSFftB1r8cyJ6TOqOVJfExMTUVxKZnS16wL4B8eBA@mail.gmail.com>
	<509FB25F.3030307@gmail.com>
	<CAKohpoksQ4ShO_QFAQORO2_oEgNtOeENFnX1C3gN_5POQSGexg@mail.gmail.com>
	<509FFF8B.3010707@gmail.com>
	<CAKohponUFABC397w=dq7j+1f5QeiOX4BCOXv=OZSNOaOTmt9oQ@mail.gmail.com>
	<CAKohponUt4264UaxM2Wr41=fbPJkUCFhKhOapjPQC=OYDuyMbQ@mail.gmail.com>
	<CAB4BAks+eym9+qNZjxwkg7XxJrMwkaYFWGM5_YQk_TzfxyoHaw@mail.gmail.com>
	<CAKohpo=U2xss6cZMBKsbLJ4G-AWeEnHz8V-HFw2NKx0fucTK8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <CAKohpo=U2xss6cZMBKsbLJ4G-AWeEnHz8V-HFw2NKx0fucTK8Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org Devel" <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 19 November 2012 12:00, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Firstly you tried square braces [ ], I am not sure if that is allowed.
> Can you point me to the specification?
http://www.devicetree.org/Device_Tree_Usage
"
a-byte-data-property = [0x01 0x23 0x34 0x56];
"
>
> And simply passing 0x50, 0x60 etc.. will make them u32 instead of
> u8. i.e. they will be stored as 0x00000050, etc.
>
> --
> viresh
