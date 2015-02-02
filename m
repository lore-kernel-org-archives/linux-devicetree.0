From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 12/13] ARM: shmobile: alt dts: Add chosen/stdout-path
Date: Tue, 03 Feb 2015 01:13:12 +0300
Message-ID: <54CFF678.6070009@cogentembedded.com>
References: <1412349104-18724-1-git-send-email-geert+renesas@glider.be>	<1412349104-18724-13-git-send-email-geert+renesas@glider.be>	<54CC06A4.9040408@cogentembedded.com> <CAMuHMdUoc0f0WReqx86Qe35zwnbT3j49q5b+fFHupQa+3QsKag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUoc0f0WReqx86Qe35zwnbT3j49q5b+fFHupQa+3QsKag@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 01/31/2015 01:18 PM, Geert Uytterhoeven wrote:

>>> Add a stdout-path property so that automatic console selection works
>>> in the absence of a "console=" parameter on the kernel command line.

>>> Note that we have to keep the "console=ttySC0,38400" parameter in
>>> chosen/bootargs, else the console will use the default setting of 115200
>>> baud.

>>     I've looked at the code and it appears that one can still specify a baud
>> rate after ':' even in the "stdout-path" prop.

> That's correct. I believe that support was added later.
> Can you please send a patch?

    Looks like Simon wants all boards to work at 115200 which is the default.

> Spaciba!

    Heh, actually it's "sbasibo". :-)

> Gr{oetje,eeting}s,

>                          Geert

WBR, Sergei

