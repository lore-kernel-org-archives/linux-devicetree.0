From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v3 3/3] ARM64: dts: amlogic: meson-gxbb: Add watchdog node
Date: Wed, 3 Aug 2016 17:29:13 -0700
Message-ID: <CAOi56cUQaFKYu2jNP0AuLOSNnNramu+DNPc+PH7K0gHDZMf+zA@mail.gmail.com>
References: <1468141867-4172-1-git-send-email-narmstrong@baylibre.com>
 <1468141867-4172-4-git-send-email-narmstrong@baylibre.com>
 <578271D3.4080704@roeck-us.net> <7hbn237aw7.fsf@baylibre.com>
 <m2bn19qsy3.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <m2bn19qsy3.fsf@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: devicetree <devicetree@vger.kernel.org>, linux-watchdog@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, lkml <linux-kernel@vger.kernel.org>, Wim Van Sebroeck <wim@iguana.be>, linux-amlogic@lists.infradead.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 3, 2016 at 5:27 PM, Kevin Hilman <khilman@baylibre.com> wrote:
> Hi Guenter,
>
> Kevin Hilman <khilman@baylibre.com> writes:
>
>> Guenter Roeck <linux@roeck-us.net> writes:
>>
>>> On 07/10/2016 02:11 AM, Neil Armstrong wrote:
>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>>
>>> Would this go in through one of the arm trees ?
>>
>> You can take the driver through the watchdog tree, but I'll take the DT
>> stuff through the amlogic tree (and submit via arm-soc).
>>
>> However, with your ack, and since this is a brand new driver, I could
>> take the driver as well.  Just let me know your preference.
>
> ping... do you have a prefernce here?
>

Oops, just noticed Wim already picked these up.

Ignore me,

Kevin
