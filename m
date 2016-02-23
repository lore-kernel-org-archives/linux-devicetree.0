From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun7i: Add dts file for the
 lamobo-r1 board
Date: Tue, 23 Feb 2016 23:11:22 +0100
Message-ID: <56CCD90A.5070908@redhat.com>
References: <1456260090-23635-1-git-send-email-hdegoede@redhat.com>
 <20160223221041.GA2992@excalibur.cnev.de>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBE5SWO3AKGQEQIDXAQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20160223221041.GA2992-Hlt6eto4P0pdWf7zwHaZWbNAH6kLmebB@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 02/23/2016 11:10 PM, Karsten Merker wrote:
> On Tue, Feb 23, 2016 at 09:41:30PM +0100, Hans de Goede wrote:
>> From: Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
>>
>> The lamobo-r1 board, sometimes called the BPI-R1 but not labelled as such
>> on the PCB, is meant as a A20 based router board. As such the board comes
>> with a built-in switch chip giving it 5 gigabit ethernet boards, and it
>
> s/gigabit ethernet boards/gigabit ethernet ports/ ?

Erm, yes.

Regards,

hans


>
>> has a large empty area on the pcb with mounting holes which will fit a
>> 2.5 inch harddisk. To complete its networking features it has a
>> Realtek RTL8192CU for WiFi 802.11 b/g/n.
>>
>> Signed-off-by: Jelle de Jong <jelledejong-OIcJOM8/mISwoUgIn9SVlA@public.gmane.org>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> Regards,
> Karsten
>
