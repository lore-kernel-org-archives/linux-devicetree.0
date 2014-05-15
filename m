From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3] drm/panel: Add support for EDT ETM0700G0DH6 and
 ET070080DH6 panels
Date: Thu, 15 May 2014 15:48:30 -0600
Message-ID: <5375362E.2030005@wwwdotorg.org>
References: <1400149547-1541-1-git-send-email-p.zabel@pengutronix.de>
 <20140515105427.GK6434@ulmo> <5374E31F.80504@wwwdotorg.org>
 <20140515214147.GD7136@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140515214147.GD7136@mithrandir>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Stefan Agner <stefan@agner.ch>, kernel@pengutronix.de, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 05/15/2014 03:41 PM, Thierry Reding wrote:
> On Thu, May 15, 2014 at 09:54:07AM -0600, Stephen Warren wrote:
>> On 05/15/2014 04:54 AM, Thierry Reding wrote:
>>> On Thu, May 15, 2014 at 12:25:47PM +0200, Philipp Zabel wrote:
>>>> The EDT ETM0700G0DH6 and ET070080DH6 are 7" 800x480 panels,
>>>> which can be supported by the simple panel driver.
>>>>
>>>> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>>>> ---
>>>> Changes since v2:
>>>>  - Added device tree binding documentation. Do we really want to add one little
>>>>    file for each panel?
>>>
>>> I guess we could move all of the compatible values into simple-panel.txt
>>> but I don't see a need for that yet.
>>
>> If they aren't added there, then I believe checkpatch will complain
>> about patches that start to use the new compatible values, since they
>> won't be documented.
> 
> Added where? simple-panel.txt or in separate files per compatible?

I assume that checkpatch simply checks all files in
Documentation/devicetree/bindings. By "there", I meant "somewhere in
that directory".

Perhaps I misinterpreted the email I was replying to; I thought you'd
meant that we didn't need to document it yet, but it looks like you were
simply discussing where to document it. Sorry for the noise.
