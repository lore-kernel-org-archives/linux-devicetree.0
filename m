From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCHv4 1/4] arm: dts: Add clock entries for timers in SOCFPGA
Date: Mon, 26 Aug 2013 10:43:09 -0600
Message-ID: <521B859D.5010609@wwwdotorg.org>
References: <1377189026-16656-1-git-send-email-dinguyen@altera.com>
 <1377301176.7061.2.camel@linux-builds1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1377301176.7061.2.camel@linux-builds1>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dinh Nguyen <dinguyen@altera.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, dinh.linux@gmail.com, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@denx.de>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <rob.herring@calxeda.com>, John Stultz <john.stultz@linaro.org>, Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>, linux-arm-kernel@lists.infradead.org, Ian Campbell <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

On 08/23/2013 05:39 PM, Dinh Nguyen wrote:
> Hi Stephen,
> 
> On Thu, 2013-08-22 at 11:30 -0500, Dinh Nguyen wrote:
>> From: Dinh Nguyen <dinguyen@altera.com>
>>
>> Set the correct clock entries for the the timers, and also clean up
>> the timer entries for SOCFPGA by removing timer<n> in the timer entry.
...
> Not sure if you our Ack for:
> [
> PATCHv4 2/4] arm: dts: Change dw-apb-timer-osc and dw-apb-timer-sp to
> just dw-apb-timer
> 
> applies to this one too. But just in case, can I get your Ack for this
> one too?

I only reviewed the binding changes, not the DT file changes themselves;
I don't really want to set a precedent for that, or it'll increase the
review volume too much.
