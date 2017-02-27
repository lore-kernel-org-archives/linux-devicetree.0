From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] devicetree: Add vendor prefix for Hwacom Systems Inc.
Date: Mon, 27 Feb 2017 07:29:14 -0600
Message-ID: <CAL_Jsq+O4gpf7Hbfx_+ppe0uVpbzxJdk49jsytsYmyP4GZyUfQ@mail.gmail.com>
References: <20170212193247.22705-1-carlo@caione.org>
 <20170212193247.22705-2-carlo@caione.org>
 <20170222142558.wbedfw6l4maatkdy@rob-hp-laptop> <m2mvd839t7.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <m2mvd839t7.fsf@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@endlessm.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux@endlessm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 26, 2017 at 3:45 PM, Kevin Hilman <khilman@baylibre.com> wrote:
> Rob Herring <robh@kernel.org> writes:
>
>> On Sun, Feb 12, 2017 at 08:32:46PM +0100, Carlo Caione wrote:
>>> From: Carlo Caione <carlo@endlessm.com>
>>>
>>> Hwacom Systems Inc. is a broadband system integrator and supplier of
>>> mobile, fixed and IP networks related services as well as
>>> multimedia application. Website: http://www.hwacom.com/
>>>
>>> Signed-off-by: Carlo Caione <carlo@endlessm.com>
>>> ---
>>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>>  1 file changed, 1 insertion(+)
>>
>> Acked-by: Rob Herring <robh@kernel.org>
>
> Rob, I assume I should take this patch along with the patch that's using
> this prefix?  Or does this go through some other DT path?

Yes, it should be applied with the rest of the series.

Rob
