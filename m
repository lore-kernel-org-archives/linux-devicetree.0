From: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Subject: Re: [PATCH V3 1/5] ARM: kirkwood: Basic support for DNS-320 and
 DNS-325
Date: Mon, 9 Apr 2012 15:20:08 +0100 (BST)
Message-ID: <alpine.DEB.2.00.1204091513250.23719@marmot.wormnet.eu>
References: <1332885255-8304-1-git-send-email-jm@lentin.co.uk>
 <201203280820.00139.arnd@arndb.de> <20120406234313.A040E3E127F@localhost>
 <201204091409.04927.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201204091409.04927.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 9 Apr 2012, Arnd Bergmann wrote:

> On Friday 06 April 2012, Grant Likely wrote:
>> On Wed, 28 Mar 2012 08:19:59 +0000, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>>> On Tuesday 27 March 2012, Jamie Lentin wrote:
>>>> Add support for the DNS-320 and DNS-325. Describe as much as currently possible
>>>> in the devicetree files, create a board-dnskw.c for everything else.
>>>>
>>>> Use IEEE-compliant "okay", rather than "ok"
>>>>
>>>> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>>>> Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
>>>> Signed-off-by: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
>>>> ---
>>>
>>> One small note about changeset comments: The part about differences from the previous
>>> version of the same patch normally goes below the '---' line, in front of the diffstat,
>>> to prevent it from going into the git changelog. Otherwise people will have no idea
>>> what it's about.
>>
>> Counter point on that.  I ask submitters to put the changelog before
>> the --- because I want it in the commit text.  It is actually helpful
>> when trying to determine exactly which iteration of a patch series got
>> committed.
>
> Fair enough, but I think in this case it was written in a confusing way. I don't
> mind if a list of review comments are included and more text is usally better
> in the changeset comment, but it would be nice to give some background, either
> by prefixing it with something "Addressed review comments from xxx:" or changing
> it to 'This version uses the IEEE-compliant "okay", rather than "ok"'.
>

Re-reading, it really isn't obvious I meant "Use IEEE-compliant..." as a 
changelog of sorts. Maybe this would have been a better commit message?

---------

Add support for the DNS-320 and DNS-325. Describe as much as currently 
possible in the devicetree files, create a board-dnskw.c for everything 
else.

Changes since last submission (V2):-

* Use IEEE-compliant "okay", rather than "ok" (adressing comments from 
Scott Wood)

---------

> 	Arnd
>

-- 
Jamie Lentin
