From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: [PATCH] Aesthetic tweaks to devicenodes.rst chapter, 0.1 DT spec.
Date: Fri, 1 Sep 2017 02:07:56 -0400 (EDT)
Message-ID: <alpine.LFD.2.21.1709010205210.21695@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1835193447-1504246079=:21695"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1835193447-1504246079=:21695
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8BIT


Aesthetic fixups to devicenodes.rst chapter of DT spec, including:

 * font changes
 * define "PIR" acronym when first used

Signed-off-by: Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>

---

diff --git a/source/devicenodes.rst b/source/devicenodes.rst
index 78b5bdb..bf82114 100644
--- a/source/devicenodes.rst
+++ b/source/devicenodes.rst
@@ -7,14 +7,14 @@ Base Device Node Types
 ----------------------

 The sections that follow specify the requirements for the base set of
-device nodes required in an |spec|-compliant devicetree.
+device nodes required in a |spec|-compliant devicetree.

 All devicetrees shall have a root node and the following nodes shall be
 present at the root of all devicetrees:

 *  One ``/cpus`` node

-*  At least one ``memory`` node
+*  At least one ``/memory`` node

 Root node
 ---------
@@ -65,7 +65,7 @@ and have the node name ``/aliases``.
 Each property of the ``/aliases`` node defines an alias. The property name
 specifies the alias name. The property value specifies the full path to
 a node in the devicetree. For example, the property serial0 =
-``"/simple-bus@fe000000/serial@llc500"`` defines the alias serial0.
+``"/simple-bus@fe000000/serial@llc500"`` defines the alias ``serial0``.

 Alias names shall be a lowercase text strings of 1 to 31 characters from
 the following set of characters.
@@ -98,7 +98,7 @@ considering a string as a device path, shall detect and use the alias.
         ethernet0 = "/simple-bus@fe000000/ethernet@31c000";
     };

-Given the alias serial0, a client program can look at the aliases node
+Given the alias ``serial0``, a client program can look at the ``/aliases`` node
 and determine the alias refers to the device path
 ``/simple-bus@fe000000/serial@llc500``.

@@ -110,8 +110,8 @@ physical memory layout for the system. If a system has multiple ranges
 of memory, multiple memory nodes can be created, or the ranges can be
 specified in the *reg* property of a single memory node.

-The name component of the node name (see section :ref:`sect-node-names`)
-shall be memory.
+The *unit-name* component of the node name (see section :ref:`sect-node-names`)
+shall be ``memory``.

 The client program may access memory not covered by any memory
 reservations (see section :ref:`sect-fdt-memory-reservation-block`)
@@ -241,16 +241,16 @@ time. It shall be a child of the root node.
     };

 Older versions of devicetrees may be encountered that contain a
-deprecated form of the stdout-path property called linux,stdout-path.
+deprecated form of the *stdout-path* property called *linux,stdout-path*.
 For compatibility, a client program might want to support
-linux,stdout-path if a stdout-path property is not present. The meaning
+*linux,stdout-path* if a *stdout-path* property is not present. The meaning
 and use of the two properties is identical.

 ``/cpus`` Node Properties
 -------------------------

-A cpus node is required for all devicetrees. It does not represent a
-real device in the system, but acts as a container for child cpu nodes
+A ``/cpus`` node is required for all devicetrees. It does not represent a
+real device in the system, but acts as a container for child ``cpu`` nodes
 which represent the systems CPUs.

 .. tabularcolumns:: | l c l J |
@@ -272,7 +272,7 @@ which represent the systems CPUs.
    :ref:`sect-standard-properties`) are allowed but are optional.


-The cpus node may contain properties that are common across CPU nodes.
+The ``/cpus`` node may contain properties that are common across ``cpu`` nodes.
 See section :ref:`sect-cpus-cpu-node-properties` for details.

 For an example, see section :ref:`sect-cpu-node-example`.
@@ -282,12 +282,12 @@ For an example, see section :ref:`sect-cpu-node-example`.
 ``/cpus/cpu*`` Node Properties
 ------------------------------

-A cpu node represents a hardware execution block that is sufficiently
+A ``cpu`` node represents a hardware execution block that is sufficiently
 independent that it is capable of running an operating system without
 interfering with other CPUs possibly running other operating systems.

 Hardware threads that share an MMU would generally be represented under
-one cpu node. If other more complex CPU topographies are designed, the
+one ``cpu`` node. If other more complex CPU topographies are designed, the
 binding for the CPU must describe the topography (e.g. threads that
 don¢t share an MMU).

@@ -295,18 +295,18 @@ CPUs and threads are numbered through a unified number-space that should
 match as closely as possible the interrupt controller¢s numbering of
 CPUs/threads.

-Properties that have identical values across CPU nodes may be placed in
-the cpus node instead. A client program must first examine a specific
-CPU node, but if an expected property is not found then it should look
-at the parent cpus node. This results in a less verbose representation
+Properties that have identical values across ``cpu`` nodes may be placed in
+the ``/cpus`` node instead. A client program must first examine a specific
+``cpu`` node, but if an expected property is not found then it should look
+at the parent ``/cpus`` node. This results in a less verbose representation
 of properties which are identical across all CPUs.

-The node name for every cpu node should be ``cpu``.
+The node name for every CPU node should be ``cpu``.

 General Properties of ``/cpus/cpu*`` nodes
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-The following table describes the general properties of CPU nodes. Some
+The following table describes the general properties of ``cpu`` nodes. Some
 of the properties described in :numref:`table-cpu-node-props` are select
 standard properties with specific applicable detail.

@@ -342,7 +342,8 @@ standard properties with specific applicable detail.
                                                    and out of bounds of the range addressed by
                                                    the interrupt controller

-                                                   If a CPU/thread's PIR is modifiable, a client
+                                                   If a CPU/thread's PIR (pending interrupt register)
+                                                   is modifiable, a client
                                                    program should modify PIR to match the *reg*
                                                    property value. If PIR cannot be modified and
                                                    the PIR value is distinct from the interrupt

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
--8323328-1835193447-1504246079=:21695--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
