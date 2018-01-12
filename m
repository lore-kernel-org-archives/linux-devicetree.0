From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: da850-lego-ev3: Add node for reboot modes
Date: Thu, 11 Jan 2018 20:22:58 -0600
Message-ID: <203bb1f1-e4d4-ca2f-4b66-386f29873861@lechnology.com>
References: <1515723685-19286-1-git-send-email-david@lechnology.com>
 <1515723685-19286-2-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515723685-19286-2-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/11/2018 08:21 PM, David Lechner wrote:
> This adds a new node for reboot modes on LEGO MINDSTORMS EV3. The EV3's
> bootloader looks for a magic number in the ARM local RAM and if found,
> it will boot into a special firmware update mode where the flash memory
> can be written via USB.
> 
> This has been testing working using the command:
> 
>      # systemctl reboot loader
> 
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---

Doh. I forgot to rebase, so this won't apply cleanly. V2 coming right up.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
