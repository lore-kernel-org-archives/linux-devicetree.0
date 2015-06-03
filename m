From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: Add dts file for the
 GA10H-A33 tablet
Date: Wed, 3 Jun 2015 10:41:47 +1000
Message-ID: <CAGRGNgU5XA1if7wgd7cSapQU7kk=mtgAD2j4XbxEQdisN03H1A@mail.gmail.com>
References: <1433274598-17366-1-git-send-email-hdegoede@redhat.com>
 <CAKON4OxsJO28aDMCvFzx_Z9n=Hyq6uBYo3hWR+04YDwjJVcTnA@mail.gmail.com>
 <CAGRGNgVTuik13PG41tebjfPkGfyDVZw54hGgMH79bpeT1mCOiw@mail.gmail.com> <CAKON4OzPv2Dbr8tFQ22sj4j+S0nyizdwbsYuvZJsVXDri=qc3Q@mail.gmail.com>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDQIP76OUQLBBYE2XGVQKGQE6RYZTQQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAKON4OzPv2Dbr8tFQ22sj4j+S0nyizdwbsYuvZJsVXDri=qc3Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, ARM Linux Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jon,

On Wed, Jun 3, 2015 at 10:40 AM, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Jun 2, 2015 at 8:35 PM, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Jon,
>>
>> On Wed, Jun 3, 2015 at 6:20 AM, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Resend with plain text for image links....
>>>
>>> I have one of these GA10H-A33 and tore it apart. They used an uncommon
>>> wifi/BT chip - RDA5990P. Took mine apart since the wifi didn't work worth
>>> two cents.
>>> http://www.rdaic.com/sites/default/files/public/RDA5990P_datasheet_V1.4.pdf
>>>
>>> Is that unpopulated pad next to the RSA5990P an option to use an Ampak
>>> module? I am looking for a A33 PCBA where I can mount a 5Ghz wi-fi module.
>>
>> Potential driver:
>> https://github.com/linuxium/3188-SRC-ORIG/tree/master/kernel/drivers/net/wireless/rda5990
>>
>> (Code implies GPL but is missing copyright / license notices, might be
>> for an older part.)
>>
>> On an unrelated note, is MediaTek buying up every last small
>> manufacturer of WiFi parts?
>
> RDA was bought by Spreadtrum

Odd: the driver I linked to has lots of MediaTek email addresses in
author fields, hence me thinking RDA had been bought by them.

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
