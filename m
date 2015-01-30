From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 12/13] ARM: shmobile: alt dts: Add chosen/stdout-path
Date: Sat, 31 Jan 2015 01:33:08 +0300
Message-ID: <54CC06A4.9040408@cogentembedded.com>
References: <1412349104-18724-1-git-send-email-geert+renesas@glider.be> <1412349104-18724-13-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1412349104-18724-13-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello.

On 10/03/2014 07:11 PM, Geert Uytterhoeven wrote:

> Add a stdout-path property so that automatic console selection works
> in the absence of a "console=" parameter on the kernel command line.

> Note that we have to keep the "console=ttySC0,38400" parameter in
> chosen/bootargs, else the console will use the default setting of 115200
> baud.

    I've looked at the code and it appears that one can still specify a baud 
rate after ':' even in the "stdout-path" prop.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

WBR, Sergei

