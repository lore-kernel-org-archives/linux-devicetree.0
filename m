From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 1/3] leds: leds-pwm: Convert to use devm_get_pwm
Date: Tue, 4 Dec 2012 09:11:02 +0100
Message-ID: <50BDB016.7010908@ti.com>
References: <1352731270-27534-1-git-send-email-peter.ujfalusi@ti.com>
 <1352731270-27534-2-git-send-email-peter.ujfalusi@ti.com>
 <CAK5ve-JDCSSOKHQG-F1RoDii62=-DiPevaD6SafndYVvOgB6Fw@mail.gmail.com>
 <50BCB391.1070305@ti.com>
 <CAK5ve-+1eQ3mPLAu2Qxw4LjNA85oEtJE-wZcL=YpQ0xBFJ6+hQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAK5ve-+1eQ3mPLAu2Qxw4LjNA85oEtJE-wZcL=YpQ0xBFJ6+hQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Bryan,

On 12/03/2012 07:32 PM, Bryan Wu wrote:
> On Mon, Dec 3, 2012 at 6:13 AM, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org> wr=
ote:
> Actually, I'm waiting for some feedback from DT maintainers about this
> new binding. But it looks find to me.

Would it be possible to have the first (or even better the first two) patch
going for 3.8 and we can leave the DT bindings for 3.9?
I would like to clean up, fix some of the OMAP related board files for 3.9
which would need the patches for the leds-pwm driver itself.

Thank you,
P=E9ter
