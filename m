From: colin@horizon.com
Subject: Re: [PATCH v2 0/2] clk: add clk accuracy support
Date: 27 Nov 2013 18:11:25 -0500
Message-ID: <20131127231125.7995.qmail@science.horizon.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: b.brezillon@overkiz.com
Cc: devicetree@vger.kernel.org, linux@horizon.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Um, do you have a definition somewhere (like in comments) of the definition
of the accuracy you're using?  So multiple people can add consistent values?

Is this the standard deviation (67% confidence), 2 standard deviations
(95%), 3 (99%), or something else?

What averaging time is this computed over?  Usually clock stability (which
I recognize is not accuracy) is expressed using the Allan deviation,

http://tf.nist.gov/general/glossary.htm#allandeviation

This is because real clocks have unbounded asymptotic error.  Over long
time intervals, have a random frequency walk characteristic, where the
frequency error after time T is proportional to sqrt(T).

So an oscillator which is stable to 1ppb over a T second interval will be
stable to 2ppb over a 4T second interval, 3ppb over a 9T second interval,
and so on.

Since accuracy is limited by stability, and there's no upper bound on
instability, there's actually no upper bound on inaccuracy, either.

(Admittedly, your typical crystal oscillators have their stability
limited by environmental instability, particularly temperature, which
dwarfs the frequency flicker noise limit.)


On the flip side, some systems are synchronized to UTC by various means.
This means (if we either neglect UTC's far sub-ppb instability, or just
define it as "perfect") that the inaccuracy over a long enough averaging
interval is zero.

But if it only synchronizes once a day, there can be significant
inaccuracy between synchronization.  Should the accuracy specification
reflect that shorter-term instability?


Finally, you can't specify *too* short an interval, because clocks also
have increasing error over small time intervals.  Below 10 seconds or
so, white noise cycle-to-cycle jitter dominates, and the fewer cycles
you average over, the larger it appears to be.


A clear definition would help people understand what numbers to put in.
