From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC PATCH 0/2] drm/panel: add simple-panel description using DT
Date: Tue, 13 May 2014 11:09:00 +0200
Message-ID: <5371E12C.8000409@samsung.com>
References: <1399645002-18000-1-git-send-email-boris.brezillon@free-electrons.com>
 <20140513075148.GF6754@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20140513075148.GF6754@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>, Boris BREZILLON <boris.brezillon@free-electrons.com>
Cc: devicetree@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

On 05/13/2014 09:51 AM, Thierry Reding wrote:
> On Fri, May 09, 2014 at 04:16:40PM +0200, Boris BREZILLON wrote:
>> Hello Thierry,
>>
>> I noticed you're describing each new panel with a new entry in the
>> of_platform_match table and a new compatible string.
>> I guess you have a good reason to do it this way, because retrieving
>> panel description from DT would be pretty easy (see this series ;-)).
>>
>> Could tell me why you chose this approach ?
> 
> The reason is that devicetree mandates that a device be identified using
> a compatible value and that compatible value should be as specific as
> possible. That compatible value should give the device driver enough
> information to know everything it needs (resolution, timings, physical
> dimension).
> 
> Having all of that data in the device tree is redundant.
> 

Many panels I have encountered have no single timings, they accepts
ranges of timings. With 'compatible' approach there is no place to
configure timings specific for particular hw configuration, unless you
abuse somehow compatible string.

However it seems there are not so many cases the same panel must be used
with different timings on different boards, anyway it is a potential issue.

Regards
Andrzej
