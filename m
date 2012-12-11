From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 1/4] leds: leds-pwm: Convert to use devm_get_pwm
Date: Tue, 11 Dec 2012 10:53:11 +0100
Message-ID: <50C70287.1060006@ti.com>
References: <1355133637-2784-1-git-send-email-peter.ujfalusi@ti.com>
 <3193669.Hv54bBklsP@barack>
 <20121211083632.GC27084@avionic-0098.adnet.avionic-design.de>
 <1406670.ryvqfkiNXS@barack>
 <20121211093100.GA8437@avionic-0098.adnet.avionic-design.de>
 <50C6FF69.3030001@ti.com>
 <20121211094812.GA22222@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121211094812.GA22222-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/11/2012 10:48 AM, Thierry Reding wrote:
> On Tue, Dec 11, 2012 at 10:39:53AM +0100, Peter Ujfalusi wrote:
>> On 12/11/2012 10:31 AM, Thierry Reding wrote:
>>> On Tue, Dec 11, 2012 at 09:57:51AM +0100, Peter Ujfalusi wrote:
>>> Okay, if there are no intree users that may be broken, then it should be
>>> fine to remove it. In that case you might want to remove the pwm_id
>>> field as well instead of deprecating it in this patch.
>>
>> The reason I marked the pwm_id as deprecated is to signal to out of tree=
 users
>> (if any) that they should stop using it since it is going to go away in =
the
>> next cycle.
>> If we remove it right away the sdp4030 board file will not going to comp=
ile in
>> subsystem trees, only in linux-next.
> =

> Okay, go ahead then. As long as the field will be removed eventually
> that's fine with me.

Thank you and yes, it will be removed.

Probably it would be a good thing to check other places for legacy
pwm_request() users and prepare them to move to (devm_)pwm_get gracefully o=
ver
coming kernel releases.

-- =

P=E9ter
