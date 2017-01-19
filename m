From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 2/3] ARM64: dts: meson-gxbb: Add support for WeTek Hub and
 Play
Date: Thu, 19 Jan 2017 10:02:51 -0800
Message-ID: <m2wpdrvsfo.fsf@baylibre.com>
References: <1484736642-5451-1-git-send-email-narmstrong@baylibre.com>
 <1484736642-5451-3-git-send-email-narmstrong@baylibre.com>
 <m2mveox9mm.fsf@baylibre.com>
 <61c3c24d-57cd-b81d-0225-5aae14352397@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <61c3c24d-57cd-b81d-0225-5aae14352397@baylibre.com> (Neil
 Armstrong's message of "Thu, 19 Jan 2017 09:12:20 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: carlo@caione.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 01/18/2017 11:53 PM, Kevin Hilman wrote:
>> Neil Armstrong <narmstrong@baylibre.com> writes:
>> 
>>> Adds support for the WeTek Hub and Play2 boards.
>>> The Hub is an extremely small IPTv Set-Top-Box and the Play2 is a more
>>> traditionnal Satellite or Terrestrial and IPTv Set-Top-Box.
>>>
>>> Both are based on the p200 Reference Design and out-of-tree support is
>>> based on OpenELEC kernel at [1].
>>>
>>> [1] https://github.com/wetek-enigma/linux-amlogic
>>>
>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> 
>> Did you get the GPIO/button info from the LibreELEC tree or did you find
>> some schematics someplace?  If you found any schematics, it would be
>> nice to have links in the DTS files.
>> 
>> Kevin
>> 
>
> It was in the dts of the LibreELEC tree, I found no schematics so far.
> I can respin a v2 with a link to the LibreELEC dts files.

No need for a respin.  But I'll s/OpenELEC/LibreELEC/ in the commit
message when applying.

Kevin
