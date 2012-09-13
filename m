From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/5] Documentation: add description of DT binding for
 the gpio-mvebu driver
Date: Thu, 13 Sep 2012 15:34:43 -0500
Message-ID: <50524363.9070100@gmail.com>
References: <1347551658-24449-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1347551658-24449-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <50524026.20104@gmail.com> <20120913223059.2d0606b2@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120913223059.2d0606b2@skate>
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
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/13/2012 03:30 PM, Thomas Petazzoni wrote:
> Dear Rob Herring,
> 
> On Thu, 13 Sep 2012 15:20:54 -0500, Rob Herring wrote:
>> On 09/13/2012 10:54 AM, Thomas Petazzoni wrote:
>>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>> Cc: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
>>> Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
>>> Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
>>> Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>>> ---
>>
>> Grant is pretty much offline right now.
> 
> Yes, I know, but MAINTAINERS does not mention an alternate maintainer
> for the GPIO subsystem. Who is the interim maintainer that will
> ultimately have to ack/nack those patches?

Linus W. is.

Rob
