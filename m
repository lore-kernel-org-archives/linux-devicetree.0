From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [REVIEW PATCH v2.1 08/11] of: smiapp: Add documentation
Date: Tue, 2 Dec 2014 02:05:04 +0200
Message-ID: <20141202000504.GV8907@valkosipuli.retiisi.org.uk>
References: <1416289426-804-9-git-send-email-sakari.ailus@iki.fi>
 <1417364809-4693-1-git-send-email-sakari.ailus@iki.fi>
 <20141201104200.GC17070@leverpostej>
 <20141201235626.GU8907@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141201235626.GU8907@valkosipuli.retiisi.org.uk>
Sender: linux-media-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 02, 2014 at 01:56:26AM +0200, Sakari Ailus wrote:
> > > +- link-frequency: List of allowed data link frequencies. An array of 64-bit
> > > +  elements.
> > 
> > Something like 'allowed-link-frequencies' might be better, unlesss this
> > is derived from another binding?
> 
> I'll use that instead.

On second thought, perhaps "safe-link-frequencies" or simply
"link-frequencies" would be better as a name. These are known-good, safe
(from EMC point of view) link frequencies that can be used.

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
