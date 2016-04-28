From: Olivier Blin <dev-RZzICDNEOQ/YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: bcm2835: dt: Add the ethernet to the device
 trees
Date: Thu, 28 Apr 2016 14:52:13 +0200
Message-ID: <m3wpnhrj42.fsf@euphor.blino.org>
References: <1454571364-24708-1-git-send-email-lkundrak@v3.sk>
 <1454571364-24708-2-git-send-email-lkundrak@v3.sk>
 <56B572D8.9030701@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <56B572D8.9030701-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> (Stephen Warren's message of
 "Fri, 5 Feb 2016 21:13:12 -0700")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 02/04/2016 12:36 AM, Lubomir Rintel wrote:
>> The hub and the ethernet in its port 1 are hardwired on the board.
>> 
>> Compared to the adapters that can be plugged into the USB ports, this
>> one has no serial EEPROM to store its MAC. Nevertheless, the Raspberry Pi
>> has the MAC address for this adapter in its ROM, accessible from its
>> firmware.
>> 
>> U-Boot can read out the address and set the local-mac-address property of the
>> node with "ethernet" alias. Let's add the node so that U-Boot can do its
>> business.
>> 
>> Model B rev2 and Model B+ entries were verified by me, the hierarchy and
>> pid/vid pair for the Version 2 was provided by Olivier Blin. Original
>> Model B is a blind short, though very likely correct.
>
> The series,
> Tested-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>
> A few nits though...
[...]

Is this still being queued in some tree?
Or does it need more fixes and a resubmit?

Without this, Raspberry Pi devices boot with a random MAC address.

-- 
Olivier Blin - blino
