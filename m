From: Anton Vorontsov <cbouatmailru@gmail.com>
Subject: Re: [PATCH v3 1/3] power: Add simple poweroff-gpio driver
Date: Tue, 20 Nov 2012 00:48:07 -0800
Message-ID: <20121120084807.GA24287@lizard>
References: <1353142266-1289-1-git-send-email-andrew@lunn.ch>
 <1353142266-1289-2-git-send-email-andrew@lunn.ch>
 <50AA6E7E.5060501@wwwdotorg.org> <20121120083749.GM10259@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20121120083749.GM10259@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: gmbnomis@gmail.com, Stephen Warren <swarren@wwwdotorg.org>, devicetree-discuss@lists.ozlabs.org, jm@lentin.co.uk, linux ARM <linux-arm-kernel@lists.infradead.org>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 20, 2012 at 09:37:49AM +0100, Andrew Lunn wrote:
> These are good comments from Stephan that i want to address. However,
> i also don't want to delay the pull-requests direction arm-soc, the
> merge window is getting close. Both Linus and Anton have Acked the
> current version, so please go with what you have and i will produce a
> patch over the top. If its available before Arnd pulls, you can squash
> it, otherwise send it upstream as a standalone patch.

I agree. Furthermore, for the fixup patch, if it goes separately, you
might want to add

 Suggested-by: Stephen Warren <swarren@wwwdotorg.org>

to give a credit for the valuable comments. :)
